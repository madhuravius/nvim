return {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "rcarriga/nvim-dap-ui"
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
  }
}
