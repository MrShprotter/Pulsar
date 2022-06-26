local lspc = require('lspconfig')
local lsp = vim.lsp
local map = vim.keymap.set

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Mapping
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  map('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', bufopts)
  map('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', bufopts)
  map('n', '<space>e', '<cmd>lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>', bufopts)
  map('n', '<space>q', ':TroubleRefresh<CR>:TroubleToggle<CR>', bufopts)
  map('n', '<space>rn', ':lua require(\'lspsaga.rename\').lsp_rename()<CR>', bufopts)
  map('n', 'K', ':lua require(\'lspsaga.hover\').render_hover_doc()<CR>', bufopts)
end

-- Handlers
local border = {
    {"╔", "FloatBorder"},
    {"═", "FloatBorder"},
    {"╗", "FloatBorder"},
    {"║", "FloatBorder"},
    {"╝", "FloatBorder"},
    {"═", "FloatBorder"},
    {"╚", "FloatBorder"},
    {"║", "FloatBorder"},
}

local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 4,
            prefix = ''
        }
    })
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspc.pyright.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    filetypes = {
        "python",
    }
}

lspc.texlab.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    filetypes = {
        'tex',
        'latex'
    }
}

lspc.sumneko_lua.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' }
            }
        }
    },
    filetypes = {
        'lua'
    }
}
