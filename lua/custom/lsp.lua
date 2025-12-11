-- [[ Configure LSP ]]
local langs = {
  'crystalline',
  'elixirls',
  'gopls',
  'html',
  'jdtls',
  'jsonls',
  'lua_ls',
  'pyright',
  'ruby_lsp',
  'rust_analyzer',
  'tflint',
  'ts_ls',
  'yamlls',
}

vim.lsp.enable(langs)

-- blink.cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = langs,
}

-- LSP handler borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

-- Load luasnip snippets from vscode-style snippet packs
require('luasnip.loaders.from_vscode').lazy_load()

-- Diagnostic configuration
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
  },
  severity_sort = true,
  float = {
    source = 'always',
  },
}

-- Store on_attach for use by plugins if needed
return {
  on_attach = on_attach,
}
