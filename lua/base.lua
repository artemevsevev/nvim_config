local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.scrolloff = 10
opt.sidescrolloff = 10

opt.hlsearch = true
opt.incsearch = true

opt.mouse:append('a')
opt.clipboard:append('unnamedplus')

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.undofile = true
opt.autoread = true
vim.bo.autoread = true

opt.cursorline = true
opt.termguicolors = true
opt.completeopt = 'menuone,noselect'
opt.inccommand = 'split'

opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

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

vim.g.have_nerd_font = true
