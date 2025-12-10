return {
  -- Snacks picker keymaps (Telescope replacement)
  {
    'folke/snacks.nvim',
    keys = {
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Help',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = 'Search Files',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Grep',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = 'Diagnostics',
      },
      {
        '<leader>s/',
        function()
          Snacks.picker.lines()
        end,
        desc = 'Fuzzy',
      },
    },
  },
}
