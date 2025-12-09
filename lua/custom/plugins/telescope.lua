return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Telescope' },
    keys = {
      { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Help' },
      { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
      { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = 'Search Files' },
      { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'Grep' },
      { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics' },
      { '<leader>sr', '<cmd>Telescope resume<cr>', desc = 'Resume' },
      { '<leader>s/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Fuzzy' },
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'neoclip')
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
