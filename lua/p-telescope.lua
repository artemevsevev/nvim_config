local keymap = vim.keymap
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
    file_ignore_patterns = {
      '.git',
      'lazy-lock.json',
    },
    dynamic_preview_title = true,
    path_display = { 'smart' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.5,
    },
  },
})

telescope.load_extension('fzf')

keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>', {})
keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<cr>', {})
keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>', {})
