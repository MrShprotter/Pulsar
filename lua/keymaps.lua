local map = vim.api.nvim_set_keymap
local lspmap = vim.keymap.set
local ops = { noremap = true, silent = true }

-- Default
map('i', 'jk', '<esc>', ops)
map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})

-- F1 .. F12
map('n', '<F1>', ':nohl<CR>', ops)

-- NvimTree
map('n', '<C-t>', ':NvimTreeToggle<CR>', ops)

-- Buferline
map('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', ops)
map('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', ops)
map('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', ops)
map('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', ops)
map('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', ops)
map('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', ops)
map('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', ops)
map('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', ops)
map('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', ops)
map('n', 'gt', ':BufferLineCycleNext<CR>', ops)
map('n', 'gT', ':BufferLineCyclePrev<CR>', ops)
map('n', 'bd', ':BufferLinePickClose<CR>', ops)
map('n', 'bp', ':BufferLinePick<CR>', ops)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', ops)
map('n', '<leader>fg', ':Telescope live_grep<CR>', ops)
map('n', '<leader>fb', ':Telescope buffers<CR>', ops)
map('n', '<leader>fn', ':Telescope help_tags<CR>', ops)
