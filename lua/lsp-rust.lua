local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').rust_analyzer.setup({})

local rt = require('rust-tools')

rt.setup({
  server = {
    capabilities = capabilities,
  },
})
