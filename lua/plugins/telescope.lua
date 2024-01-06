local mapvimkey = require('util.keymapper').mapvimkey

local config = function()
  local telescope = require('telescope')

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = 'close',
          ['<C-j>'] = 'move_selection_next',
          ['<C-k>'] = 'move_selection_previous',
        },
      },
      dynamic_preview_title = true,
      path_display = { 'smart' },
    },
    file_ignore_patterns = {
      '.git',
      'lazy-lock.json',
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        previewer = true,
      },
      buffers = {
        previewer = true,
      },
    },
    layout_config = {
      horizontal = {
        preview_cutoff = 100,
        preview_width = 0.5,
      },
    },
  })
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
  keys = {
    -- mapvimkey('<leader>fk', 'Telescope keymaps', 'Show Keymaps'),
    -- mapvimkey('<leader>fh', 'Telescope help_tags', 'Show Help Tags'),
    mapvimkey('<leader>f', 'Telescope find_files', 'Find Files'),
    mapvimkey('<leader>g', 'Telescope live_grep', 'Live Grep'),
    mapvimkey('<leader>b', 'Telescope buffers', 'Find Buffers'),
  },
}
