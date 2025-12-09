return {
  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    lazy = false,
    init = function()
      require('monokai-pro').setup {
        terminal_background = true,
        devicons = true,
        filter = 'spectrum',
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },
}
