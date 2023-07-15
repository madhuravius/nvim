-- Vim default keymap
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- which key keymaps
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  ["b"] = {
    name = "Buffer",
    h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close Buffers Left" },
    l = { "<cmd>BufferCloseBuffersRight<cr>", "Close Buffers Right" },
    n = { "<cmd>BufferNext<cr>", "Next Buffer" },
    b = { "<cmd>BufferPrevious<cr>", "Previous Buffer" },
    c = { "<cmd>BufferClose<cr>", "Close Buffer" },
    m = { "<cmd>JABSOpen<cr>", "Buffer Switcher" }
  },
  ["e"] = { "<cmd>NeoTreeShowToggle<cr>", "Explorer" },
  ["g"] = {
    name = "Git",
    g = { "<cmd>LazyGit<cr>", "LazyGit" },
  },
  ["F"] = { "<cmd>Spectre<cr>", "Find/Replace" },
  ["q"] = { "<cmd>quit<cr>", "quit" },
  ["Q"] = { "<cmd>quitall<cr>", "quit all" },
  ["s"] = { name = "Search" },
  ["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
    R = { '<cmd>lua require("renamer").rename()<cr>', "rename" },
    S = { "<cmd>SymbolsOutline<cr>", "Symbols" }
  },
  ["w"] = { "<cmd>write<cr>", "write" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
