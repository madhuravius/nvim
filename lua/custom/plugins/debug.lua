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
      require('nvim-dap-virtual-text').setup()
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
