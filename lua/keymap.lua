vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true, remap = false })

keymap.set('n', '<c-a>', 'ggVG')
keymap.set('n', 'U', '<c-r>')

keymap.set({ 'n', 'x' }, '<leader>p', '"0p')
keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('i', 'jk', '<Esc>', { noremap = true })
keymap.set('i', 'jj', '<Esc>', { noremap = true })

keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

keymap.set(
  'n',
  'k',
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)
keymap.set(
  'n',
  'j',
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)

-- keymap.set('n', '<c-j>', [[:m .+1<cr>==]])
-- keymap.set('n', '<c-k>', [[:m .-2<cr>==]])
keymap.set('v', '<c-j>', [[:m '>+1<cr>gv=gv]])
keymap.set('v', '<c-k>', [[:m '<-2<cr>gv=gv]])

keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the lower window' }
)
keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the upper window' }
)

keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')
keymap.set('n', '<c-d>', '<c-d>zz')
keymap.set('n', '<c-u>', '<c-u>zz')

keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
