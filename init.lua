---@diagnostic disable: undefined-global

-- Enable Neovim's built-in module loader for faster startup
vim.loader.enable()

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable terminal colors
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

-- Disable LSP watcher on Linux for performance
local ok, wf = pcall(require, 'vim.lsp._watchfiles')
if ok then
  wf._watchfunc = function()
    return function() end
  end
end

-- Load plugins and configuration modules
require('lazy').setup('custom.plugins.lazy_spec', {
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- Load configuration modules
require 'custom.options'
require 'custom.autocmds'
require 'custom.lsp'
require 'custom.keys'
