if true then return {} end
return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    -- Load kanagawa as your main colorscheme
    vim.cmd 'colorscheme kanagawa'

    -- Create highlight groups for active/inactive windows
    vim.api.nvim_set_hl(0, 'ActiveWindow', { bg = '#16161e' }) -- Normal kanagawa background
    vim.api.nvim_set_hl(0, 'InactiveWindow', { bg = '#1f1f28' }) -- Dimmed background

    -- Set up autocommands to switch highlights when changing windows
    local function set_window_highlights()
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:ActiveWindow')
    end

    local function clear_window_highlights()
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:InactiveWindow')
    end

    -- Create the autocommands
    vim.api.nvim_create_autocmd('WinEnter', {
      callback = set_window_highlights,
    })

    vim.api.nvim_create_autocmd('WinLeave', {
      callback = clear_window_highlights,
    })
  end,
}
