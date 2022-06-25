local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Options
opt.nu = true
opt.rnu = true
opt.ai = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.mouse = a
opt.et = true
opt.scrolloff = 5
opt.sts = 4
opt.vb = true
opt.bg = dark
opt.ignorecase = true
opt.termguicolors = true
opt.cursorline = true
opt.cot = menu, menuone, noselect
g.tm = 1000

-- Cmd
cmd'set noswapfile'
cmd'syntax on'
cmd'colorscheme onedarker'

-- Plugins
require'Comment'.setup()

require'nvim-tree'.setup {
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  "
            }
        },
        icons = {
            show = {
                git = false
            }
        }
    }
}

require'bufferline'.setup {
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center"
            }
        },
        separator_style = 'slant',
        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
                local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
                local info = #vim.diagnostic.get(0, {severity = seve.INFO})
                local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                end
                return result
            end,
        },
        show_buffer_close_icons = false,
        show_close_icon = false
    }
}

require'telescope'.setup {}

vim.fn['lexima#add_rule']({char = '$', input_after = '$', filetype = 'latex'})
vim.fn['lexima#add_rule']({char = '$', at = '\\%#\\$', leave = 1, filetype = 'latex'})
vim.fn['lexima#add_rule']({char = '<BS>', at = '\\$\\%#\\$', delete = 1, filetype = 'latex'})

require'lspsaga'.init_lsp_saga {
    code_action_lightbulb = { enable = false }
}

require'todo-comments'.setup {}

require'lsp.cmp-icons'.setup {}
