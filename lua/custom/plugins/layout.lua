return {
  { 'Bekaboo/dropbar.nvim' },
  {
    "matbme/JABS.nvim",
    config = function()
      require('jabs').setup({
        position = { 'center', 'top' },
        preview_position = 'left',
        preview = {
          width = 60,
          height = 20,
          border = 'single',
        },
        use_devicons = true
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        window = {
          width = 25,
          mappings = {
            ["<space>"] = "none",
          },
        },
        file_system = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
            show_hidden_count = true,
            never_show = {},
          },
        },
      }
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handle = {
          color = "#403E41"
        }
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  }, {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = true end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    animation = true,
    insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
},
}
