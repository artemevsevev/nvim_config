local mapkey = require('util.keymapper').mapvimkey

mapkey('<leader>q', 'q', 'n')
mapkey('<leader>w', 'w', 'n')
mapkey('<leader>x', 'x', 'n')

mapkey('U', 'redo', 'n')

mapkey('<leader>h', 'nohlsearch', 'n')

-- Buffer Navigation
mapkey('<leader>gn', 'bnext', 'n') -- Next buffer
mapkey('<leader>gp', 'bprevious', 'n') -- Prev buffer

-- Directory Navigatio}n
mapkey('<leader>m', 'NvimTreeFocus', 'n')
mapkey('<leader>e', 'NvimTreeToggle', 'n')

-- Pane and Window Navigation
mapkey('<C-h>', '<C-w>h', 'n') -- Navigate Left
mapkey('<C-j>', '<C-w>j', 'n') -- Navigate Down
mapkey('<C-k>', '<C-w>k', 'n') -- Navigate Up
mapkey('<C-l>', '<C-w>l', 'n') -- Navigate Right
mapkey('<C-h>', 'wincmd h', 't') -- Navigate Left
mapkey('<C-j>', 'wincmd j', 't') -- Navigate Down
mapkey('<C-k>', 'wincmd k', 't') -- Navigate Up
mapkey('<C-l>', 'wincmd l', 't') -- Navigate Right

-- Window Management
mapkey('<leader>sv', 'vsplit', 'n') -- Split Vertically
mapkey('<leader>sh', 'split', 'n') -- Split Horizontally
mapkey('<C-Up>', 'resize +2', 'n')
mapkey('<C-Down>', 'resize -2', 'n')
mapkey('<C-Left>', 'vertical resize +2', 'n')
mapkey('<C-Right>', 'vertical resize -2', 'n')

-- Indenting
vim.keymap.set('v', '<', '<gv', { silent = true, noremap = true })
vim.keymap.set('v', '>', '>gv', { silent = true, noremap = true })

local api = vim.api

-- Zen Mode
-- api.nvim_set_keymap('n', '<leader>zn', ':TZNarrow<CR>', {})
-- api.nvim_set_keymap('v', '<leader>zn', ":'<,'>TZNarrow<CR>", {})
-- api.nvim_set_keymap('n', '<leader>sm', ':TZFocus<CR>', {})
-- api.nvim_set_keymap('n', '<leader>zm', ':TZMinimalist<CR>', {})
-- api.nvim_set_keymap('n', '<leader>za', ':TZAtaraxis<CR>', {})

-- Comments
api.nvim_set_keymap('n', '<C-_>', 'gtc', { noremap = false })
api.nvim_set_keymap('v', '<C-_>', 'goc', { noremap = false })

local keymap = vim.keymap

keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true, remap = false })
keymap.set(
  { 'n', 'v' },
  '<leader><space>',
  '<Nop>',
  { silent = true, remap = false }
)

keymap.set('i', 'jk', '<Esc>', { noremap = true })
keymap.set('i', 'jj', '<Esc>', { noremap = true })

keymap.set('n', '<c-j>', [[:m .+1<cr>==]])
keymap.set('n', '<c-k>', [[:m .-2<cr>==]])
keymap.set('v', '<c-j>', [[:m '>+1<cr>gv=gv]])
keymap.set('v', '<c-k>', [[:m '<-2<cr>gv=gv]])

keymap.set({ 'n', 'x' }, '<leader>p', '"0p')
keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
