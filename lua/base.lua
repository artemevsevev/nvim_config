local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = false
opt.incsearch = true

opt.mouse:append('a')
opt.clipboard:append('unnamedplus')

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.cursorline = true
opt.termguicolors = true
opt.completeopt = 'menuone,noselect'

opt.updatetime = 250
opt.timeoutlen = 300

opt.signcolumn = 'yes'

local highlight_group =
  vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
