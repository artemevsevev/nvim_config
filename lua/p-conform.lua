require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    json = { 'prettierd' },
    yaml = { 'prettierd' },
    html = { 'prettierd' },
    css = { 'prettierd' },
    markdown = { 'prettierd' },
    graphql = { 'prettierd' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
