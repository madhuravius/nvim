return {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
      require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
    end
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        silent = true,
      },
    },
    opts = {
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "repl", size = 0.30 },
            { id = "console", size = 0.70 },
          },
          size = 0.19,
          position = "bottom",
        },
        {
          elements = {
            { id = "scopes", size = 0.30 },
            { id = "breakpoints", size = 0.20 },
            { id = "stacks", size = 0.10 },
            { id = "watches", size = 0.30 },
          },
          size = 0.20,
          position = "right",
        },
      },
      controls = {
        enabled = true,
        element = "repl",
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = vim.g.border_chars,
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    },
    config = function(_, opts)
      require("dapui").setup(opts)
      vim.fn.sign_define('DapBreakpoint', { text=vim.g.gsign('', 'B'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text=vim.g.gsign('ﳁ', 'B?'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text=vim.g.gsign('', 'B!'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl= 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text=vim.g.gsign('', 'Bi'), texthl='DapLogPoint', linehl='DapLogPointLine', numhl= 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text=vim.g.gsign('', '=>'), texthl='DapStopped', linehl='DapStoppedLine', numhl= 'DapStopped' })
    end,
  }
}
