local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"phaazon/hop.nvim"}, {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    }, {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {'nvim-treesitter/nvim-treesitter-textobjects'},
        build = ":TSUpdate"
    }, {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            {'williamboman/mason.nvim', config = true},
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            {'j-hui/fidget.nvim', opts = {}},

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim'
        }
    }, {"ellisonleao/gruvbox.nvim", priority = 1000}, {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-cmdline"}, {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    }, {"lewis6991/gitsigns.nvim"}, {
        "williamboman/mason.nvim",
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }, {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end
    }, {"jose-elias-alvarez/null-ls.nvim"}, {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", "linrongbin16/lsp-progress.nvim"
        }
    }, {"nvim-tree/nvim-web-devicons"}, {"windwp/nvim-autopairs"},
    {"akinsho/toggleterm.nvim", version = "*", config = true},
    {"Djancyp/outline"}, {"terrortylor/nvim-comment"},
    {"akinsho/bufferline.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}},
    {"hrsh7th/cmp-nvim-lsp-signature-help"}, {
        "linrongbin16/lsp-progress.nvim",
        event = {"VimEnter"},
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("lsp-progress").setup() end
    }, {"folke/which-key.nvim"}, {"hrsh7th/vim-vsnip"},
    {"hrsh7th/vim-vsnip-integ"}, {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = {{"nvim-tree/nvim-web-devicons"}}
    }
})
