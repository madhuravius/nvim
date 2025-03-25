return {
  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    config = function()
      require('copilot_cmp').setup()
    end,
    dependencies = {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      config = function()
        require('copilot').setup {
          panel = {
            auto_refresh = true,
            enabled = true,
          },
          suggestion = {
            auto_trigger = true,
            enabled = true,
            keymap = {
              accept = '<M-a>',
            },
          },
        }
      end,
    },
  },
  -- revisit this whole file with: https://github.com/ikotun-dev/nvim_rough/blob/fd9889de2529c795ca295d022a2789001d31d51f/lua/plugins/copilotchat.lua#L3
  -- in mind
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    version = 'v3.9.0',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'zbirenbaum/copilot-cmp' },
      { 'nvim-lua/plenary.nvim' },
      { 'folke/snacks.nvim' },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
          require('telescope').load_extension 'ui-select'
        end,
      },
    },
    build = 'make tiktoken',
    config = function()
      require('CopilotChat').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
        window = {
          border = 'rounded',
          height = 45,
          layout = 'float',
          relative = 'cursor',
          row = 1,
          title = 'Copilot 🤖',
          width = 80,
          zindex = 50,
        },
      }
    end,
  },
}
