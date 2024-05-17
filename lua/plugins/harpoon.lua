return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    vim.keymap.set({ 'n', 'x' }, '<leader>a', function()
      require('harpoon'):list():add()
    end, { desc = 'Add to harpoon' }),
    vim.keymap.set({ 'n', 'x' }, '<leader>l', function()
      local harpoon = require('harpoon')
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle harpoon' }),
    vim.keymap.set({ 'n', 'x' }, ']]', function()
      require('harpoon'):list():next({
        ui_nav_wrap = true,
      }, { desc = 'Next harpoon' })
    end),
    vim.keymap.set({ 'n', 'x' }, '[[', function()
      require('harpoon'):list():prev({
        ui_nav_wrap = true,
      })
    end, { desc = 'Previous harpoon' }),
  },
}
