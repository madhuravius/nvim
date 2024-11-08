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
          },
          suggestion = {
            auto_trigger = true,
          },
        }
      end,
    },
  },
  -- revisit this whole file with: https://github.com/ikotun-dev/nvim_rough/blob/fd9889de2529c795ca295d022a2789001d31d51f/lua/plugins/copilotchat.lua#L3
  -- in mind
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    build = 'make tiktoken',
    config = function()
      require('CopilotChat').setup {
        window = {
          height = 45,
          layout = 'vertical',
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
