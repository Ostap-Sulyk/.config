vim.api.nvim_set_keymap('n','<Space>','<NOP>',{noremap = true, silent = ture})
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true })

-- better window navigation
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', {silent = true})


-- indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- i hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- switch buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- ; instead of :
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})

-- move selected line/code block 
-- vim.api.nvim_set_keymap('x', 'K', ':move \'<-5<CR>gv-gv\'', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('x', 'J', ':move \'>+4<CR>gv-gv\'', {noremap = true, silent = true}) 


