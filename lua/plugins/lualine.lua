local config = function()
  require('lualine').setup({
    options = {
      theme = 'auto',
      globalstatus = true,
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    tabline = {},
  })
end

return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = config,
}
