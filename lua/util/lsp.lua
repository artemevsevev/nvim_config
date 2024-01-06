local mapkey = require('util.keymapper').mapvimkey

local M = {}
local builtin = require('telescope.builtin')

M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  mapkey('<leader>ld', 'Lspsaga finder', 'n', opts) -- go to definition
  -- mapkey('<leader>gd', 'Lspsaga peek_definition', 'n', opts) -- peak definition
  mapkey('gd', 'Lspsaga goto_definition', 'n', opts) -- go to definition
  mapkey('gt', 'Lspsaga goto_type_definition', 'n', opts) -- go to definition
  mapkey('<leader>a', 'Lspsaga code_action', 'n', opts) -- see available code actions
  mapkey('<leader>r', 'Lspsaga rename', 'n', opts) -- smart rename
  mapkey('<leader>D', 'Lspsaga show_workspace_diagnostics', 'n', opts) -- show  diagnostics for line
  mapkey('<leader>d', 'Lspsaga show_buf_diagnostics', 'n', opts) -- show diagnostics for cursor
  mapkey('<leader>[d', 'Lspsaga diagnostic_jump_prev', 'n', opts) -- jump to prev diagnostic in buffer
  mapkey('<leader>]d', 'Lspsaga diagnostic_jump_next', 'n', opts) -- jump to next diagnostic in buffer
  mapkey('K', 'Lspsaga hover_doc', 'n', opts) -- show documentation for what is under cursor

  vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
  vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, opts)

  -- if client.name == 'pyright' then
  --   mapkey('<leader>oi', 'PyrightOrganizeImports', 'n', opts) -- organise imports
  --   mapkey('<leader>db', 'DapToggleBreakpoint', 'n', opts) -- toggle breakpoint
  --   mapkey('<leader>dr', 'DapContinue', 'n', opts) -- continue/invoke debugger
  --   mapkey('<leader>dt', "lua require('dap-python').test_method()", 'n', opts) -- run tests
  -- end
end

return M
