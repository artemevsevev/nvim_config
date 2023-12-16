require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'vim',
    'rust',
    'json',
    'html',
    'css',
    'regex',
    'markdown',
    'markdown_inline',
    'toml',
    'yaml',
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
})
