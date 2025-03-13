return {
  { 'farmergreg/vim-lastplace' },
  {
    'AckslD/nvim-neoclip.lua',
    requires = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
      { 'ibhagwan/fzf-lua' },
    },
    config = function()
      require('neoclip').setup {}
    end,
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
  {
    'ojroques/vim-oscyank',
  },
  { 'onsails/lspkind.nvim' },
  {
    'vim-crystal/vim-crystal',
  },
  {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
    config = function()
      require('dressing').setup {
        input = {
          enabled = true,
          default_prompt = 'Input',
          trim_prompt = true,
          title_pos = 'center',
          start_in_insert = true,
          border = 'single',
          relative = 'editor',
          prefer_width = 40,
          width = nil,
          max_width = { 140, 0.9 },
          min_width = { 20, 0.2 },
          buf_options = {},
          win_options = {
            wrap = false,
            list = true,
            listchars = 'precedes:…,extends:…',
            sidescrolloff = 0,
          },
          mappings = {
            n = {
              ['<Esc>'] = 'Close',
              ['<CR>'] = 'Confirm',
            },
            i = {
              ['<C-c>'] = 'Close',
              ['<CR>'] = 'Confirm',
              ['<Up>'] = 'HistoryPrev',
              ['<Down>'] = 'HistoryNext',
            },
          },
        },
        select = {
          enabled = false,
        },
      }
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'windwp/nvim-spectre',
    event = 'BufRead',
    config = function()
      require('spectre').setup()
    end,
  },
  {
    'hrsh7th/cmp-nvim-lsp-signature-help',
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ 'css', 'scss', 'html', 'javascript' }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    'hiphish/rainbow-delimiters.nvim',
    branch = 'master',
  },
  {
    'filipdutescu/renamer.nvim',
    config = function()
      require('renamer').setup {}
    end,
    dependencies = 'nvim-lua/plenary.nvim',
  },
  -- below used for code folding
  {
    'kevinhwang91/nvim-ufo',
    config = function()
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
      }
    end,
    dependencies = 'kevinhwang91/promise-async',
  },
}
