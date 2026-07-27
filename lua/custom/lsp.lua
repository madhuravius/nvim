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
  'zls',
}

local lsp_dir = vim.fn.stdpath 'config' .. '/lsp'
for filename in vim.fs.dir(lsp_dir) do
  if filename:match '%.lua$' then
    local module_name = filename:gsub('%.lua$', ''):gsub('-', '_')
    local filepath = lsp_dir .. '/' .. filename
    vim.lsp.config(module_name, dofile(filepath))
  end
end

vim.lsp.enable(langs)

-- blink.cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = langs,
}

-- LSP handler borders
vim.lsp.handlers['textDocument/hover'] = function(err, result, ctx, config)
  return vim.lsp.handlers.hover(err, result, ctx, vim.tbl_deep_extend('force', config or {}, { border = 'rounded' }))
end
vim.lsp.handlers['textDocument/signatureHelp'] = function(err, result, ctx, config)
  return vim.lsp.handlers.signature_help(err, result, ctx, vim.tbl_deep_extend('force', config or {}, { border = 'rounded' }))
end

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
