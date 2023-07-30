return {
  { "farmergreg/vim-lastplace" },
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'kkharji/sqlite.lua',           module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
      { 'ibhagwan/fzf-lua' },
    },
    config = function()
      require('neoclip').setup({
      })
    end,
  },
  {
    "vim-crystal/vim-crystal",
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
  },
  {
    "filipdutescu/renamer.nvim",
    config = function()
      require("renamer").setup({})
    end,
    dependencies = "nvim-lua/plenary.nvim"
  },
  -- below used for code folding
  {
    'kevinhwang91/nvim-ufo',
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end,
    dependencies = 'kevinhwang91/promise-async',
  },
}
