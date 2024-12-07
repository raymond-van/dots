--------------------------------------
-- GENERAL
--------------------------------------

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<S-Esc>', ':q!<CR>')
vim.keymap.set('n', '<C-q>', ':bd<CR>', { desc = 'Close buffer', noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Comment
vim.keymap.set('t', '<CTRL-/>', 'gcc', { desc = 'Exit terminal mode' })

--------------------------------------
-- PLUGIN SPECIFC
--------------------------------------
--------------------------------------
-- Bufferline
--------------------------------------
-- Keybindings for buffer navigation
vim.api.nvim_set_keymap('n', '<CTRL-Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CTRL-S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
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
vim.api.nvim_set_keymap('n', '<leader>w', [[:lua vim.cmd('bdelete! ' .. vim.api.nvim_get_current_buf())<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { desc = 'Write', noremap = true, silent = true }) NOTE: autosave enabled
-- vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { desc = 'Quit', noremap = true, silent = true }) NOTE: use <Esc><Esc> instead
vim.api.nvim_set_keymap('n', '<leader>o[', ':BufferLineTogglePin<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o]', ':BufferLineSortByExtension <CR>', { noremap = true, silent = true })

--------------------------------------
-- Toggleterm
--------------------------------------
vim.keymap.set('n', '<leader>`', ':ToggleTerm <CR>', { noremap = true, desc = 'Toggleterm' })
vim.keymap.set('n', '<S-leader>`', ':ToggleTermToggleAll <CR>', { noremap = true, desc = 'Toggleterm toggle all' })
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.keymap.set({ 'n', 't' }, '<C-1>', ':TermSelect<CR>')

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
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
--------------------------------------
---
vim.keymap.set('n', '<leader>mi', function()
  -- local venv = os.getenv 'CONDA_PREFIX'
  local venv = os.getenv 'CONDA_DEFAULT_ENV'
  if venv ~= nil then
    -- venv = venv .. '/share/jupyter/kernels/python3'
    vim.cmd(('MoltenInit %s'):format(venv))
  else
    vim.cmd 'MoltenInit python3'
  end
end, { desc = 'Initialize Molten for python3', silent = true })
vim.keymap.set('n', '<leader>e', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'run operator selection' })
vim.keymap.set('n', '<leader>rl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'evaluate line' })
vim.keymap.set('n', '<leader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })
vim.keymap.set('v', '<leader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'evaluate visual selection' })
vim.keymap.set('n', '<leader>os', ':noautocmd MoltenEnterOutput<CR>', { desc = 'open output window', silent = true })
vim.keymap.set('n', '<leader>oh', ':MoltenHideOutput<CR>', { desc = 'close output window', silent = true })
vim.keymap.set('n', '<leader>md', ':MoltenDelete<CR>', { desc = 'delete Molten cell', silent = true })
vim.keymap.set('n', '<leader>M', ':MoltenInfo<CR>', { desc = 'delete Molten cell', silent = true })

-- NOTE: FOR QUARTO KEYMAPS SEE after/ftplugins/markdown.lua, pasted below for reference

--vim.keymap.set('n', '<localleader>r', runner.run_cell, { desc = 'run cell', silent = true })
--vim.keymap.set('n', '<localleader>ma', runner.run_all, { desc = 'run all cells', silent = true })
--vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true })

--------------------------------------
-- Auto-session
--------------------------------------

vim.keymap.set('n', '<leader>ss', ':SessionSearch<CR>', { desc = 'Session search' })

--------------------------------------
--
--------------------------------------
--------------------------------------
--
--------------------------------------
--------------------------------------
--
--------------------------------------
--------------------------------------
--
--------------------------------------
