return {
  { 'Bekaboo/dropbar.nvim' },
  {
    'matbme/JABS.nvim',
    config = function()
      require('jabs').setup {
        position = { 'center', 'top' },
        preview_position = 'left',
        preview = {
          width = 60,
          height = 20,
          border = 'single',
        },
        use_devicons = true,
      }
    end,
  },
  -- commenting Noice for now, while nice poor performance
  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   },
  --   config = function()
  --     require('noice').setup {
  --       routes = {
  --         {
  --           filter = {
  --             event = 'msg_show',
  --             kind = '',
  --             find = 'written',
  --           },
  --           opts = { skip = true },
  --         },
  --       },
  --       lsp = {
  --         override = {
  --           ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
  --           ['vim.lsp.util.stylize_markdown'] = true,
  --           ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
  --         },
  --       },
  --       presets = {
  --         bottom_search = true, -- use a classic bottom cmdline for search
  --         command_palette = true, -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = true, -- add a border to hover docs and signature help
  --       },
  --       views = {
  --         cmdline_popup = {
  --           border = {
  --             style = 'rounded',
  --             padding = { 1, 1 },
  --           },
  --           filter_options = {},
  --           win_options = {
  --             winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
  --           },
  --         },
  --         popupmenu = {
  --           relative = 'editor',
  --           position = {
  --             row = 8,
  --             col = '50%',
  --           },
  --           size = {
  --             width = 60,
  --             height = 10,
  --           },
  --           border = {
  --             style = 'rounded',
  --             padding = { 0, 1 },
  --           },
  --           win_options = {
  --             winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        window = {
          width = 25,
          mappings = {
            ['<space>'] = 'none',
          },
        },
        filesystem = {
          filtered_items = {
            visible = true,
          },
        },
      }
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup {
        handle = {
          color = '#403E41',
        },
      }
    end,
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('symbols-outline').setup()
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = true
    end,
    opts = {
      animation = true,
      insert_at_start = true,
      auto_hide = true,
      clickable = true,
      focus_on_close = 'left',
      highlight_visible = true,
      icons = {
        button = '',
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '' },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = '' },
        },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
        pinned = { button = '' },
        separator = { left = '▎', right = '' },
        modified = { button = '●' },
      },
      maximum_padding = math.huge,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
