local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

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

cmd'set noswapfile'
cmd'syntax on'
cmd'colorscheme onedarker'

g.tm = 1000

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
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center"
            }
        },
        separator_style = 'slant'
    }
}
require('telescope').setup {}

vim.fn['lexima#add_rule']({char = '$', input_after = '$', filetype = 'latex'})
vim.fn['lexima#add_rule']({char = '$', at = '\\%#\\$', leave = 1, filetype = 'latex'})
vim.fn['lexima#add_rule']({char = '<BS>', at = '\\$\\%#\\$', delete = 1, filetype = 'latex'})
