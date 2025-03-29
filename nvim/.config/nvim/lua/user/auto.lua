local uv = vim.loop

-- vim.api.nvim_create_autocmd({ 'VimEnter', 'VimLeave' }, {
--   callback = function()
--     if vim.env.TMUX_PLUGIN_MANAGER_PATH then
--       uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
--     else
--       uv.spawn('home/ray/.tmux/plugins/tmux-window-name/scripts/rename_session_windows.py', {})
--     end
--   end,
-- })

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd 'normal! g`"zz'
    end
  end,
})

-- -- Auto resize splits when the terminal's window is resized
-- vim.api.nvim_create_autocmd("VimResized", {
--     command = "wincmd =",
-- })

-- remove line numbers from terminals
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autosave
vim.api.nvim_create_autocmd({ 'FocusLost', 'ModeChanged', 'TextChanged', 'BufEnter' }, { desc = 'autosave', pattern = '*', command = 'silent! update' })

-- Neotree
vim.api.nvim_create_autocmd('VimLeavePre', {
  command = ':Neotree close',
})

-- Theme focusing
-- -- Create highlight groups for active/inactive windows
-- vim.api.nvim_set_hl(0, 'InactiveWindow', { bg = '#000000' }) -- Normal kanagawa background
-- vim.api.nvim_set_hl(0, 'ActiveWindow', { bg = '#78a1ab' }) -- Dimmed background
--
-- -- Set up autocommands to switch highlights when changing windows
-- local function set_window_highlights()
--   local win = vim.api.nvim_get_current_win()
--   vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:ActiveWindow')
-- end
--
-- local function clear_window_highlights()
--   local win = vim.api.nvim_get_current_win()
--   vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:InactiveWindow')
-- end
--
-- -- Create the autocommands
-- vim.api.nvim_create_autocmd('WinEnter', {
--   callback = set_window_highlights,
-- })
--
-- vim.api.nvim_create_autocmd('WinLeave', {
--   callback = clear_window_highlights,
-- })
