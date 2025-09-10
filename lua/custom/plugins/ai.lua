return {
  {
    'olimorris/codecompanion.nvim',
    config = function()
      require('codecompanion').setup {
        strategies = {
          chat = {
            adapter = 'copilot',
          },
          inline = {
            adapter = 'copilot',
          },
          cmd = {
            adapter = 'copilot',
          },
        },
        chat = {
          icons = {
            buffer_pin = ' ',
            buffer_watch = '👀 ',
          },
        },
        window = {
          layout = 'float', -- float|vertical|horizontal|buffer
          position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
          border = 'single',
          height = 0.8,
          width = 0.45,
          relative = 'editor',
          full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
          sticky = false, -- when set to true and `layout` is not `"buffer"`, the chat buffer will remain opened when switching tabs
          opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = '0',
            linebreak = true,
            list = false,
            numberwidth = 1,
            signcolumn = 'no',
            spell = false,
            wrap = true,
          },
        },
        display = {
          diff = {
            enabled = true,
            close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...

            -- Options for the split diff provider
            layout = 'vertical', -- vertical|horizontal split
            opts = {
              'internal',
              'filler',
              'closeoff',
              'algorithm:histogram', -- https://adamj.eu/tech/2024/01/18/git-improve-diff-histogram/
              'indent-heuristic', -- https://blog.k-nut.eu/better-git-diffs
              'followwrap',
              'linematch:120',
            },

            diff_signs = {
              signs = {
                text = '▌', -- Sign text for normal changes
                reject = '✗', -- Sign text for rejected changes in super_diff
                highlight_groups = {
                  addition = 'DiagnosticOk',
                  deletion = 'DiagnosticError',
                  modification = 'DiagnosticWarn',
                },
              },
              -- Super Diff options
              icons = {
                accepted = ' ',
                rejected = ' ',
              },
              colors = {
                accepted = 'DiagnosticOk',
                rejected = 'DiagnosticError',
              },
            },
          },
        },
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
