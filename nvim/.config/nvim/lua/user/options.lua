-----------------------
---
-- [[ Setting options ]]
------------------------

local conda_env = os.getenv 'CONDA_PREFIX' -- Get the current Conda environment prefix
conda_env = conda_env .. '/bin/python3'
vim.g.python3_host_prog = vim.fn.expand(conda_env)

-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.termguicolors = true

-- Autosave
vim.api.nvim_create_autocmd({ 'FocusLost', 'ModeChanged', 'TextChanged', 'BufEnter' }, { desc = 'autosave', pattern = '*', command = 'silent! update' })

------------------------
-- PLUGINS
------------------------

-- Auto-session
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

------------------------
-- MOLTEN
------------------------
-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
vim.g.molten_auto_open_output = false
-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
vim.g.molten_image_provider = 'image.nvim'
-- optional, I like wrapping. works for virt text and the output window
vim.g.molten_wrap_output = true
-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
vim.g.molten_virt_text_output = true
-- this will make it so the output shows up below the \`\`\` cell delimiter
vim.g.molten_virt_lines_off_by_1 = true
-- HIGHLIGHTS
vim.api.nvim_set_hl(0, 'MoltenOutputBorder', { link = 'FloatBorder' }) -- Link to FloatBorder
vim.api.nvim_set_hl(0, 'MoltenOutputBorderFail', { link = 'ErrorMsg' }) -- Link to ErrorMsg
vim.api.nvim_set_hl(0, 'MoltenOutputBorderSuccess', { link = 'Title' }) -- Link to Title
vim.api.nvim_set_hl(0, 'MoltenOutputWin', { link = 'NormalFloat' }) -- Link to NormalFloat
vim.api.nvim_set_hl(0, 'MoltenOutputWinNC', { link = 'NonText' }) -- Link to NonText
vim.api.nvim_set_hl(0, 'MoltenOutputFooter', { link = 'SpecialComment' }) -- Link to SpecialComment
vim.api.nvim_set_hl(0, 'MoltenCell', { link = 'CursorLine' }) -- Link to CursorLine
vim.api.nvim_set_hl(0, 'MoltenVirtualText', { link = 'Comment' }) -- Link to Comment
vim.api.nvim_set_hl(0, 'MoltenOutputBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'MoltenOutputBorderFail', { link = 'ErrorMsg' })
vim.api.nvim_set_hl(0, 'MoltenOutputBorderSuccess', { link = 'Title' })
vim.api.nvim_set_hl(0, 'MoltenOutputWin', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'MoltenOutputWinNC', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'MoltenOutputFooter', { link = 'SpecialComment' })
vim.api.nvim_set_hl(0, 'MoltenCell', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'MoltenVirtualText', { link = 'Comment' })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'jupyter', 'markdown', 'ipynb', 'ipynb.md', 'md' }, -- Add markdown as well
  callback = function()
    vim.api.nvim_set_hl(0, 'MoltenOutputBorder', { link = 'FloatBorder' })
    vim.api.nvim_set_hl(0, 'MoltenOutputBorderFail', { link = 'ErrorMsg' })
    vim.api.nvim_set_hl(0, 'MoltenOutputBorderSuccess', { link = 'Title' })
    vim.api.nvim_set_hl(0, 'MoltenOutputWin', { link = 'NormalFloat' })
    vim.api.nvim_set_hl(0, 'MoltenOutputWinNC', { link = 'NonText' })
    vim.api.nvim_set_hl(0, 'MoltenOutputFooter', { link = 'SpecialComment' })
    vim.api.nvim_set_hl(0, 'MoltenCell', { link = 'CursorLine' })
    vim.api.nvim_set_hl(0, 'MoltenVirtualText', { link = 'Comment' })
  end,
})

-- vim.api.nvim_create_autocmd('VimEnter', {
-- command = ':silent !kitty @ set-spacing padding=0 margin=0',
-- })

vim.api.nvim_create_autocmd('VimLeavePre', {
  command = ':Neotree close',
})

------------------------
-- STARTUP
------------------------
-- Sort buffer tabs by extension
-- require('bufferline').sort_by 'extension'
--   require('plugins.bufferline').sort_by('extension')
-- vim.api.nvim_create_autocmd('VimEnter', {
-- command = ':Neotree',
-- callback = function()
-- command = ':Neotree',
-- end,
-- })
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Check if there are files to edit
    if vim.fn.argc() == 0 then
      return
    end
    -- Check if alpha-nvim is active
    local is_dashboard_active = vim.bo.filetype == 'alpha'
    if not is_dashboard_active then
      -- Open Neo-tree if a file is being edited
      -- require("neo-tree").setup({})
      vim.cmd 'Neotree show'
    end
  end,
})

