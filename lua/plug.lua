require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'ap/vim-css-color'
    use 'lervag/vimtex'
    use 'sirver/ultisnips'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'tc50cal/vim-terminal'
    use 'mattn/emmet-vim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSEnable highlight' }
    use 'cohama/lexima.vim'
    use 'fisadev/vim-isort'
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup({theme = "pulsar"})
        end
    }
    use 'LunarVim/onedarker.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'numToStr/Comment.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'simrat39/symbols-outline.nvim'
    
    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use { 'glepnir/lspsaga.nvim', branch = 'main' }
    use 'williamboman/nvim-lsp-installer'
end)
