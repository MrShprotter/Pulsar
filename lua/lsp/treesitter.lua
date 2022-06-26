require'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "lua", "latex" },
    sync_install = false,
    ignore_install = { "javascript" },

    highlight = {
        enable = true,
        disable = { "tex", "latex" },
        additional_vim_regex_highlighting = false,
    },
}
