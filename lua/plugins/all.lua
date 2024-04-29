return {
  {
    'RRethy/vim-illuminate',
    {
      'sainnhe/gruvbox-material',
      config = function()
        vim.g.gruvbox_material_foreground = 'original'
        -- vim.g.gruvbox_material_background = 'original'
        vim.g.gruvbox_material_statusline_style = 'original'
      end,
    },
    'lewis6991/gitsigns.nvim',
    {
      'mrcjkb/rustaceanvim',
      version = '^4',
      ft = { 'rust' },
    },
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
      event = 'InsertEnter',
      dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',
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
    'tpope/vim-sleuth',
  },
}
