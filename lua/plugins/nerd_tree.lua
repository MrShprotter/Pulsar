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
