-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'neovim/nvim-lspconfig' },
  {
    'windwp/nvim-spectre',
    event = 'BufRead',
    config = function()
      require('spectre').setup()
    end,
  },
  {
    'romgrk/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end,
  },
  {
    'sigmasd/deno-nvim',
    config = function()
      require('deno-nvim').setup {
        server = {
          root_dir = require('lspconfig.util').root_pattern('deno.json', 'deno.jsonc', 'denonvim.tag'),
        },
      }
    end,
  },
}
