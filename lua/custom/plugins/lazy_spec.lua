-- Plugin specifications for lazy.nvim
return {
  -- Utility plugins (load immediately)
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',

  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion (load immediately - needed for editing)
  {
    'saghen/blink.cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'saghen/blink.compat',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    version = '1.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_forward()
            else
              return cmp.select_next()
            end
          end,
          'snippet_forward',
          'fallback',
        },
        ['<S-Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_backward()
            else
              return cmp.select_prev()
            end
          end,
          'snippet_backward',
          'fallback',
        },
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = {
          auto_show = false,
          auto_show_delay_ms = 0,
          window = {
            border = 'rounded',
          },
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'nvim_lua' },
        compat = { 'nvim_lsp', 'nvim_lsp_signature_help', 'nvim_lua', 'buffer', 'path', 'luasnip', 'vsnip' },
        providers = {
          lsp = {
            name = 'lsp',
            enabled = true,
            max_items = 300,
          },
          snippets = {
            name = 'snippets',
            enabled = true,
          },
          buffer = {
            name = 'buffer',
            enabled = true,
            min_keyword_length = 2,
          },
          nvim_lua = {
            name = 'nvim_lua',
            enabled = true,
            min_keyword_length = 2,
            module = 'blink.compat.source',
          },
        },
      },
      snippets = {
        preset = 'luasnip',
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
    },
    opts_extend = { 'sources.default' },
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      spec = {
        { '<leader>F', '<cmd>Spectre<cr>', desc = 'Find/Replace', nowait = true, remap = false },
        { '<leader>Q', '<cmd>quitall<cr>', desc = 'Quit all', nowait = true, remap = false },
        { '<leader>b', group = 'Buffer', nowait = true, remap = false },
        { '<leader>bb', '<cmd>BufferPrevious<cr>', desc = 'Previous Buffer', nowait = true, remap = false },
        { '<leader>bc', '<cmd>BufferClose<cr>', desc = 'Close Buffer', nowait = true, remap = false },
        { '<leader>bh', '<cmd>BufferCloseBuffersLeft<cr>', desc = 'Close Buffers Left', nowait = true, remap = false },
        { '<leader>bl', '<cmd>BufferCloseBuffersRight<cr>', desc = 'Close Buffers Right', nowait = true, remap = false },
        { '<leader>bm', '<cmd>JABSOpen<cr>', desc = 'Buffer Switcher', nowait = true, remap = false },
        { '<leader>ba', '<cmd>enew<cr>', desc = 'Buffer Add', nowait = true, remap = false },
        { '<leader>bn', '<cmd>BufferNext<cr>', desc = 'Next Buffer', nowait = true, remap = false },
        { '<leader>c', '<cmd>BufferClose<cr>', desc = 'Close', nowait = true, remap = false },
        { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Explorer', nowait = true, remap = false },
        { '<leader>g', group = 'Git', nowait = true, remap = false },
        { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Diff View close', nowait = true, remap = false },
        { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit', nowait = true, remap = false },
        { '<leader>go', '<cmd>DiffviewOpen<cr>', desc = 'Diff View open', nowait = true, remap = false },
        { '<leader>q', '<cmd>quit<cr>', desc = 'Quit', nowait = true, remap = false },
        { '<leader>s', group = 'Search', nowait = true, remap = false },
        { '<leader>t', group = 'Diagnostics', nowait = true, remap = false },
        { '<leader>tR', '<cmd>lua require("renamer").rename()<cr>', desc = 'Rename', nowait = true, remap = false },
        { '<leader>w', '<cmd>write<cr>', desc = 'Write', nowait = true, remap = false },
      },
    },
  },

  -- UI plugins (defer to VeryLazy for faster startup)
  { 'nvim-lualine/lualine.nvim', event = 'VeryLazy', opts = { options = { icons_enabled = true, component_separators = '|', section_separators = '' } } },
  { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy', main = 'ibl', opts = { scope = { enabled = false } } },
  { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },

  { import = 'custom.plugins' },
}
