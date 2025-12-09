return {
  {
    -- Theme inspired by Atom
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    config = function()
      require('monokai-pro').setup {
        terminal_background = true,
        devicons = true,
        filter = 'spectrum',
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },
}
