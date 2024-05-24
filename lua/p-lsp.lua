local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({})

local keymap = vim.keymap

require('lspsaga').setup({
  ui = {
    border = 'none',
  },
  symbol_in_winbar = {
    enable = true,
  },
  lightbulb = {
    enable = false,
    sign = false,
  },
  definition = {
    keys = {
      edit = 'o',
    },
  },
})

keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')
keymap.set('n', '<leader>d', '<cmd>Lspsaga show_buf_diagnostics<cr>')
keymap.set('n', '<leader>D', '<cmd>Lspsaga show_workspace_diagnostics<cr>')

-- local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', opts)
    vim.keymap.set('n', 'gt', '<cmd>Lspsaga peek_type_definition<cr>', opts)
    vim.keymap.set('n', 'gf', '<cmd>Lspsaga finder<cr>', opts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
    -- vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>r', '<cmd>Lspsaga rename<cr>', opts)
    vim.keymap.set('n', '<space>ct', '<cmd>Lspsaga term_toggle<cr>', opts)
    vim.keymap.set(
      { 'n', 'v' },
      '<space>ca',
      '<cmd>Lspsaga code_action<cr>',
      opts
    )
    vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>Lspsaga outline<cr>', opts)

    vim.lsp.inlay_hint.enable()
  end,
})

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
