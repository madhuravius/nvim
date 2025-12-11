return {
  filetypes = { 'ruby' },
  cmd = { 'ruby-lsp' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
    addonSettings = {
      ['Ruby LSP Rails'] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
  reuse_client = function(client, config)
    config.cmd_cwd = config.root_dir
    return client.config.cmd_cwd == config.cmd_cwd
  end,
}
