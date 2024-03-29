local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'RRethy/vim-illuminate',
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_foreground = 'original'
      -- vim.g.gruvbox_material_background = 'original'
      vim.g.gruvbox_material_statusline_style = 'original'
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  'lewis6991/gitsigns.nvim',
  'simrat39/rust-tools.nvim',
  'nvimdev/lspsaga.nvim',
  'nvim-lualine/lualine.nvim',
  {
    'ggandor/leap.nvim',
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  'gcmt/wildfire.vim',
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end,
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
    },
  },

  'MattesGroeger/vim-bookmarks',
  'tom-anders/telescope-vim-bookmarks.nvim',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
  },
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
    },
  },

  'mg979/vim-visual-multi',

  { 'folke/which-key.nvim', opts = {} },

  {
    'saecki/crates.nvim',
    tag = 'stable',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },
  {
    'Kasama/nvim-custom-diagnostic-highlight',
    config = function()
      require('nvim-custom-diagnostic-highlight').setup({})
    end,
  },
  -- {
  --   'm4xshen/hardtime.nvim',
  --   dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  --   opts = {
  --     disable_mouse = false,
  --   },
  -- },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
  'rcarriga/nvim-notify',
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
    end,
  },
})

-- require('gruvbox').setup({
--   transparent_mode = true,
--   overrides = {
--     GitSignsAdd = { link = 'GruvboxGreenSign' },
--     GitSignsChange = { link = 'GruvboxAquaSign' },
--     GitSignsDelete = { link = 'GruvboxRedSign' },
--     Type = { link = 'GruvboxAqua' },
--     Identifier = { link = 'GruvboxFg1' },
--     Operator = { link = 'GruvboxFg1' },
--     Delimiter = { link = 'GruvboxFg1' },
--     Special = { link = 'GruvboxFg1' },
--     Macro = { link = 'GruvboxBlue' },
--     Function = { link = 'GruvboxYellow' },
--     ['@type.qualifier'] = { link = 'GruvboxRed' },
--   },
-- })
-- vim.cmd('colorscheme gruvbox')

vim.cmd('colorscheme gruvbox-material')

require('leap').create_default_mappings()

require('base')
require('keymap')
require('p-mason')
require('p-lsp')
require('lsp-lua')
require('p-conform')
require('p-tree')
require('p-telescope')
require('p-bookmark')
require('p-cmp')
require('p-treesitter')
require('p-text')
require('p-comment')
require('p-lualine')
require('lsp-rust')
require('p-git')
