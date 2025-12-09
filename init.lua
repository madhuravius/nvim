---@diagnostic disable: undefined-global
-- Impatient: speeds up startup by bytecode caching Lua modules
pcall(require, 'impatient')

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.termguicolors = true
vim.opt.termguicolors = true
vim.opt.swapfile = false

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
local ok, wf = pcall(require, 'vim.lsp._watchfiles')
if ok then
  -- disable lsp watcher. Too slow on linux
  wf._watchfunc = function()
    return function() end
  end
end

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  { 'lewis6991/impatient.nvim', lazy = false },
  'tpope/vim-fugitive',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim' },

  {
    -- Autocompletion
    'saghen/blink.cmp',
    dependencies = {
      -- Snippet Engine
      'L3MON4D3/LuaSnip',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

      -- Compatibility layer for nvim-cmp sources
      'saghen/blink.compat',

      -- External completion sources
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

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
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
  {
    -- Theme inspired by Atom
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    config = function()
      require('monokai-pro').setup {
        terminal_background = true,
        devicons = true,
        filter = 'spectrum',
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      scope = { enabled = false },
    },
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', tag = 'v0.2.0', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true
vim.opt.wrap = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

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

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  modules = {},
  sync_install = false,
  ignore_install = {},
  ensure_installed = {
    'astro',
    'bash',
    'c',
    'cpp',
    'elixir',
    'go',
    'hcl',
    'java',
    'json',
    'kotlin',
    'lua',
    'markdown',
    'make',
    'nix',
    'prisma',
    'proto',
    'python',
    'ruby',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vimdoc',
    'vim',
    'yaml',
  },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  rainbow = {
    enable = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local langs = {
  'elixirls',
  'gopls',
  'html',
  'jdtls',
  'jsonls',
  'lua_ls',
  'pyright',
  'ruby_lsp',
  'rust_analyzer',
  'tflint',
  'ts_ls',
  'yamlls',
}

vim.lsp.enable(langs)

-- blink.cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = langs,
}

-- [[ Configure blink.cmp ]]
-- blink.cmp is configured via the plugin spec above (opts)
-- Load luasnip snippets from vscode-style snippet packs
require('luasnip.loaders.from_vscode').lazy_load()

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
require 'custom.keys'

-- Show help text when cursorhold
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({focus=false, scope="line"})]]
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
  },
  severity_sort = true,
  float = {
    source = 'always',
  },
}
