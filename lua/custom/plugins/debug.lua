return {
  {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
  },
  {
    'mfussenegger/nvim-dap',
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require('nvim-dap-virtual-text').setup {}
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
      require('mason-nvim-dap').setup {
        ensure_installed = { 'bash', 'codelldb', 'delve', 'elixir', 'javadb', 'javatest', 'js', 'python' },
        automatic_installation = true,
        handlers = {},
      }
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    config = function()
      local mason_path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
      require('dap-python').setup(mason_path .. 'packages/debugpy/venv/bin/python')
    end,
  },
  {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup()
    end,
  },
  {
    'suketa/nvim-dap-ruby',
    config = function()
      require('dap-ruby').setup()
    end,
  },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          handlers = {
            ['jdtls'] = function()
              require('java').setup()
            end,
          },
        },
      },
    },
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    opts = function()
      local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
      return {
        dap = { adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path) },
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    opts = {
      mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
      },
      layouts = {
        {
          elements = {
            { id = 'repl', size = 0.50 },
            { id = 'console', size = 0.50 },
          },
          size = 0.19,
          position = 'bottom',
        },
        {
          elements = {
            { id = 'scopes', size = 0.30 },
            { id = 'breakpoints', size = 0.20 },
            { id = 'stacks', size = 0.30 },
          },
          size = 0.20,
          position = 'left',
        },
      },
      controls = {
        enabled = true,
        element = 'repl',
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = 'single',
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
    },
    config = function(_, opts)
      require('dapui').setup(opts)
    end,
  },
}
