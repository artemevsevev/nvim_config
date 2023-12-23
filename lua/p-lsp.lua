-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({})

local keymap = vim.keymap

require('lspsaga').setup({
  ui = {
    border = 'rounded',
  },
  symbol_in_winbar = {
    enable = false,
  },
})

keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')
keymap.set('n', '<leader>d', '<cmd>Lspsaga show_buf_diagnostics<cr>')
keymap.set('n', '<leader>D', '<cmd>Lspsaga show_workspace_diagnostics<cr>')

local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
    vim.keymap.set('n', 'gt', '<cmd>Lspsaga goto_type_definition<cr>', opts)
    vim.keymap.set('n', 'gf', '<cmd>Lspsaga finder<cr>', opts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>r', '<cmd>Lspsaga rename<cr>', opts)
    vim.keymap.set(
      { 'n', 'v' },
      '<space>ca',
      '<cmd>Lspsaga code_action<cr>',
      opts
    )
    vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
  end,
})

local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
