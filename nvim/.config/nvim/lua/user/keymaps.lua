-------------------------------------
-- GENERAL
--------------------------------------
----- Remove the delay by setting s to no-op before Flash mapping
-- vim.keymap.set('n', 's', '<Nop>', { silent = true })
-- vim.keymap.
----- Properly unmap f and F in all modes
-- vim.keymap.del({ 'n', 'x', 'o' }, 'f')
-- vim.keymap.del({ 'n', 'x', 'o' }, 'F')
-- Map Flash.nvim to f and F
-- vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
--   require('flash').jump()
-- end)
-- vim.keymap.set({ 'n', 'x', 'o' }, 'F', function()
--   require('flash').jump { search = { forward = false } }
-- end)

-- Map original f/F behavior to space-f/space-F
-- vim.keymap.set({ 'n', 'x', 'o' }, '<space>f', 'f', { remap = false })
-- vim.keymap.set({ 'n', 'x', 'o' }, '<space>F', 'F', { remap = false })
-- vim.keymap.set('n', 'f', '')
-- vim.keymap.set('x', 'f', '')
-- vim.keymap.set('o', 'f', '')
-- -- vim.keymap.set('n', 'F', '')
-- -- vim.keymap.set('x', 'F', '')
-- -- vim.keymap.set('o', 'F', '')
-- -- -- Map Flash.nvim to f
-- vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
--   require('flash').jump()
-- end)
--
-- vim.api.nvim_set_keymap('n', '<leader>n', ':IncRename ' .. vim.fn.expand '<cword>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>rn', function()
--   return ':IncRename ' .. vim.fn.expand '<cword>'
-- end, { expr = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-]>', '<C-w>+', { desc = 'Increase height' })
vim.keymap.set('n', '<C-[>', '<C-w>-', { desc = 'Decrease height' })

-- Quit
-- vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = 'Quit (:q)', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-q>', ':bd!<CR>', { desc = 'Close current buffer (:bd!)', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':qa<CR>', { desc = 'Quit', noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


--------------------------------------
-- PLUGIN SPECIFC
--------------------------------------
--------------------------------------
-- Bufferline
--------------------------------------
-- Keybindings for buffer navigation
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0', ':BufferLineGoToBuffer -1<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>w', [[:lua vim.cmd('bdelete! ' .. vim.api.nvim_get_current_buf())<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>w', ':BufferLineCloseCurrent<CR>', { desc = 'Close current buffer', noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { desc = 'Write', noremap = true, silent = true }) NOTE: autosave enabled
-- vim.api.nvim_set_keymap('n', '<leader>o[', ':BufferLineTogglePin<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-w>p', ':BufferLineTogglePin<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-w>c', ':BufferLineCloseOthers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o]', ':BufferLineSortByExtension <CR>', { noremap = true, silent = true })

--------------------------------------
-- Toggleterm
--------------------------------------
-- vim.keymap.set('n', '<leader>`', ':ToggleTerm <CR>', { noremap = true, desc = 'Toggleterm' })
-- vim.keymap.set('n', '<S-leader>`', ':ToggleTermToggleAll <CR>', { noremap = true, desc = 'Toggleterm toggle all' })
-- function _G.set_terminal_keymaps()
--   local opts = { buffer = 0 }
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--   vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
-- end
-- vim.keymap.set({ 'n', 't' }, '<C-`>', ':TermSelect<CR>')
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'
--------------------------------------
-- Overseer Just tasks
--------------------------------------
-- Basic run
vim.keymap.set('n', '<leader>oo', ':OverseerRun <CR>', { noremap = true, desc = 'Overseer run menu' })
-- Build
vim.keymap.set('n', '<leader>ob', function()
  require('overseer').run_template { name = 'just', params = { task = 'build' } }
end, { desc = 'Overseer: build file' })
-- Build + Run
vim.keymap.set('n', '<leader>or', function()
  require('overseer').run_template { name = 'just', params = { task = 'run' } }
end, { desc = 'Overseer: run file' })
-- Clean
vim.keymap.set('n', '<leader>oc', function()
  require('overseer').run_template { name = 'just', params = { task = 'clean' } }
end, { desc = 'Overseer: clean outputs' })
-- Toggle
vim.keymap.set('n', '<leader>ot', ':OverseerToggle <CR>', { noremap = true, desc = 'Overseer toggle' })
vim.keymap.set('n', '<leader>op', ':OverseerOpen <CR>', { noremap = true, desc = 'Overseer open' })
vim.keymap.set('n', '<leader>oc', ':OverseerClose <CR>', { noremap = true, desc = 'Overseer close' })
-- vim.keymap.set('n', '<leader>oc', ':Overseer <CR>', { noremap = true, desc = 'Overseer close' })

--------------------------------------
-- Molten / Quarto
-- --------------------------------------
-- vim.keymap.set('n', '<leader>mi', function()
--   -- local venv = os.getenv 'CONDA_PREFIX'
--   local venv = os.getenv 'CONDA_DEFAULT_ENV'
--   if venv ~= nil then
--     -- venv = venv .. '/share/jupyter/kernels/python3'
--     vim.cmd(('MoltenInit %s'):format(venv))
--   else
--     vim.cmd 'MoltenInit python3'
--   end
-- end, { desc = 'Initialize Molten for python3', silent = true })
-- vim.keymap.set('n', '<leader>e', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'run operator selection' })
-- vim.keymap.set('n', '<leader>rl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'evaluate line' })
-- vim.keymap.set('n', '<leader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })
-- vim.keymap.set('v', '<leader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'evaluate visual selection' })
-- vim.keymap.set('n', '<leader>os', ':noautocmd MoltenEnterOutput<CR>', { desc = 'open output window', silent = true })
-- vim.keymap.set('n', '<leader>oh', ':MoltenHideOutput<CR>', { desc = 'close output window', silent = true })
-- vim.keymap.set('n', '<leader>md', ':MoltenDelete<CR>', { desc = 'delete Molten cell', silent = true })
-- vim.keymap.set('n', '<leader>M', ':MoltenInfo<CR>', { desc = 'delete Molten cell', silent = true })
--
-- NOTE: FOR QUARTO KEYMAPS SEE after/ftplugins/markdown.lua, pasted below for reference

--vim.keymap.set('n', '<localleader>r', runner.run_cell, { desc = 'run cell', silent = true })
--vim.keymap.set('n', '<localleader>ma', runner.run_all, { desc = 'run all cells', silent = true })
--vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true })

--------------------------------------
-- Auto-session
--------------------------------------

-- Moved map to telescope file
-- vim.keymap.set('n', '<leader>tn', ':SessionSearch<CR>', { desc = '[S]earch Sessio[n]s' })

--------------------------------------
-- gen
--------------------------------------

vim.keymap.set({ 'n', 'v' }, '<leader>a', ':Gen<CR>')
-- vim.keymap.set('v', '<leader>]', ':Gen Enhance_Grammar_Spelling<CR>')








--------------------------------------
-- windows plugin
--------------------------------------
local function cmd(command)
  return table.concat { '<Cmd>', command, '<CR>' }
end
vim.keymap.set('n', '<C-m>', cmd 'WindowsMaximize')
vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<C-=>', cmd 'WindowsEqualize')
