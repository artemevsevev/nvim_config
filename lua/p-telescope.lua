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
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('ui-select')

local builtin = require('telescope.builtin')

keymap.set('n', '<leader>f', builtin.find_files, {})
keymap.set('n', '<leader>g', builtin.live_grep, {})
keymap.set('n', '<leader>b', builtin.buffers, {})
keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
