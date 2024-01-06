return {
  'ellisonleao/gruvbox.nvim',
  name = 'gruvbox',
  lazy = false,
  priority = 999,
  config = function()
    require('gruvbox').setup({
      transparent_mode = true,
      overrides = {
        GitSignsAdd = { link = 'GruvboxGreenSign' },
        GitSignsChange = { link = 'GruvboxAquaSign' },
        GitSignsDelete = { link = 'GruvboxRedSign' },
        Type = { link = 'GruvboxAqua' },
        Identifier = { link = 'GruvboxFg1' },
        Operator = { link = 'GruvboxFg1' },
        Delimiter = { link = 'GruvboxFg1' },
        Special = { link = 'GruvboxFg1' },
        Macro = { link = 'GruvboxBlue' },
        Function = { link = 'GruvboxYellow' },
        ['@type.qualifier'] = { link = 'GruvboxRed' },
      },
    })
    vim.cmd('colorscheme gruvbox')
  end,
}
