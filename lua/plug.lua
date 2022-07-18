require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'windwp/nvim-autopairs'
    use 'ap/vim-css-color'
    use 'lervag/vimtex'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'mattn/emmet-vim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }
    use 'fisadev/vim-isort'
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup({theme = "pulsar"})
        end
    }
    use { 'LunarVim/onedarker.nvim', commit = 'b00dd21' }
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'numToStr/Comment.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'simrat39/symbols-outline.nvim'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use 'nvim-lua/popup.nvim'

    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use { 'glepnir/lspsaga.nvim', branch = 'main' }
    use 'williamboman/nvim-lsp-installer'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip'
        }
    }
    use 'onsails/lspkind.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'HallerPatrick/py_lsp.nvim'
end)
