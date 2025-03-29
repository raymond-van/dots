return {
  'mellow-theme/mellow.nvim',
  opt = {},
  config = function()
    vim.g.mellow_italic_comments = true
    vim.g.mellow_italic_functions = true
    -- vim.g.mellow_bold_functions = true
    -- vim.g.mellow_highlight_overrides = {
    --   ['NormalNC'] = { link = 'Normal' },
    -- }

    -- -- Theme focusing
    -- -- Create highlight groups for active/inactive windows
    -- vim.api.nvim_set_hl(0, 'InactiveWindow', { bg = '#000000' }) -- Normal kanagawa background
    -- vim.api.nvim_set_hl(0, 'ActiveWindow', { bg = '#ffffff' }) -- Dimmed background
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

    vim.cmd [[colorscheme mellow]]
  end,
}
