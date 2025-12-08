return {
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    options = {},
    config = function()
      require('trouble').setup {
        height = 7,
      }
    end,
  },
}
