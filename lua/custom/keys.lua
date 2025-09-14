-- Vim default keymap
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>p', require('telescope.builtin').commands, { desc = '[p] Find commands' })
vim.keymap.set('n', '<leader>f', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- debug / breakpoint keymaps taken from: https://harrisoncramer.me/debugging-in-neovim/
local _, dap = pcall(require, 'dap')
local _, ui = pcall(require, 'dapui')

vim.keymap.set('n', '<leader>du', function()
  require('dapui').toggle()
end, { desc = '[d]ebug [u]i' })
vim.keymap.set('n', '<leader>dS', function()
  dap.continue()
  ui.toggle {}
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', false, true, true), 'n', false) -- Spaces buffers evenly
end, { desc = '[d]ebug [S]tart' })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Set [d]ebug [b]reakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[d]ebug [c]ontinue' })
vim.keymap.set('n', '<leader>dR', dap.restart, { desc = '[d]ebug [R]estart' })
vim.keymap.set('n', '<leader>dL', function()
  if vim.fn.filereadable '.vscode/launch.json' then
    require('dap.ext.vscode').load_launchjs(nil, {})
  end
  require('dap').continue()
end, { desc = '[d]ebug [L]oad config' })
vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = '[d]ebug over [o]' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[d]ebug step [i]n' })
vim.keymap.set('n', '<leader>do', dap.step_out, { desc = '[d]ebug step [o]ut' })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end, { desc = '[d]ebug [h]over' })
vim.keymap.set('n', '<leader>dC', dap.clear_breakpoints, { desc = '[d]ebug [C]lear breakpoints' })
vim.keymap.set('n', '<leader>de', function()
  dap.clear_breakpoints()
  ui.toggle {}
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', false, true, true), 'n', false)
end, { desc = '[d]ebug [e]nd' })
vim.keymap.set('v', 'Y', '<Plug>OSCYankVisual', { desc = '[Y] copy over osc' })

-- which key keymaps
local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

local setup = {
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
}

local opts = {
  mode = 'n', -- NORMAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  { '<leader>C', '<cmd>Telescope neoclip<cr>', desc = 'Clipboard', nowait = true, remap = false },
  { '<leader>F', '<cmd>Spectre<cr>', desc = 'Find/Replace', nowait = true, remap = false },
  { '<leader>Q', '<cmd>quitall<cr>', desc = 'Quit all', nowait = true, remap = false },
  { '<leader>S', '<cmd>DarkLightSwitch<cr>', desc = 'Theme Switcher', nowait = true, remap = false },
  { '<leader>b', group = 'Buffer', nowait = true, remap = false },
  { '<leader>bb', '<cmd>BufferPrevious<cr>', desc = 'Previous Buffer', nowait = true, remap = false },
  { '<leader>bc', '<cmd>BufferClose<cr>', desc = 'Close Buffer', nowait = true, remap = false },
  { '<leader>bh', '<cmd>BufferCloseBuffersLeft<cr>', desc = 'Close Buffers Left', nowait = true, remap = false },
  { '<leader>bl', '<cmd>BufferCloseBuffersRight<cr>', desc = 'Close Buffers Right', nowait = true, remap = false },
  { '<leader>bm', '<cmd>JABSOpen<cr>', desc = 'Buffer Switcher', nowait = true, remap = false },
  { '<leader>bn', '<cmd>BufferNext<cr>', desc = 'Next Buffer', nowait = true, remap = false },
  { '<leader>c', '<cmd>BufferClose<cr>', desc = 'Close', nowait = true, remap = false },
  { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Explorer', nowait = true, remap = false },
  { '<leader>g', group = 'Git', nowait = true, remap = false },
  { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Diff View close', nowait = true, remap = false },
  { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit', nowait = true, remap = false },
  { '<leader>go', '<cmd>DiffviewOpen<cr>', desc = 'Diff View open', nowait = true, remap = false },
  { '<leader>n', '<cmd>enew<cr>', desc = 'New', nowait = true, remap = false },
  { '<leader>q', '<cmd>quit<cr>', desc = 'Quit', nowait = true, remap = false },
  { '<leader>s', group = 'Search', nowait = true, remap = false },
  { '<leader>t', group = 'Diagnostics', nowait = true, remap = false },
  { '<leader>tR', '<cmd>lua require("renamer").rename()<cr>', desc = 'Rename', nowait = true, remap = false },
  { '<leader>tS', '<cmd>SymbolsOutline<cr>', desc = 'Symbols', nowait = true, remap = false },
  { '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document', nowait = true, remap = false },
  { '<leader>tl', '<cmd>TroubleToggle loclist<cr>', desc = 'Loclist', nowait = true, remap = false },
  { '<leader>tq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix', nowait = true, remap = false },
  { '<leader>tr', '<cmd>TroubleToggle lsp_references<cr>', desc = 'References', nowait = true, remap = false },
  { '<leader>tt', '<cmd>TroubleToggle<cr>', desc = 'Trouble', nowait = true, remap = false },
  { '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace', nowait = true, remap = false },
  { '<leader>w', '<cmd>write<cr>', desc = 'Write', nowait = true, remap = false },
}

which_key.setup(setup)
which_key.add(mappings, opts)
