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

-- Snacks picker keymaps
vim.keymap.set('n', '<leader>?', function()
  Snacks.picker.recent()
end, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function()
  Snacks.picker.buffers()
end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>p', function()
  Snacks.picker.commands()
end, { desc = '[p] Find commands' })
vim.keymap.set('n', '<leader>f', function()
  Snacks.picker.lines()
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gf', function()
  Snacks.picker.git_files()
end, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sw', function()
  Snacks.picker.grep_word()
end, { desc = '[S]earch current [W]ord' })
