-----------------------
-- [[ Setting options ]]
------------------------
local conda_env = os.getenv 'CONDA_PREFIX' -- Get the current Conda environment prefix
conda_env = conda_env .. '/bin/python3'
vim.g.python3_host_prog = vim.fn.expand(conda_env)

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true -- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes:1'
-- vim.opt.signcolumn = 'number'
-- vim.opt.signcolumn = 'yes'
-- vim.opt.signcolumn = 'no'
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function (_)
--     vim.opt.signcolumn = 'yes:1'
--   end
-- })
-- vim.api.nvim_create_autocmd('LspDetach', {
--   callback = function (_)
--     vim.opt.signcolumn = 'no'
--   end
-- })
-- vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
--   pattern = "*",
--   callback = function()
--     vim.opt.signcolumn = "yes:1"
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({"WinLeave"}, {
--   pattern = "*",
--   callback = function()
--     vim.opt.signcolumn = "no"
--   end,
-- })
--

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
vim.opt.scrolloff = 5

vim.opt.termguicolors = true

------------------------
-- PLUGINS
------------------------
-- Auto-session
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

------------------------
-- UFO
------------------------
-- vim.o.foldcolumn = '1' -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- more lsp/coc/treesitter config to do?

------------------------
-- Telescope
------------------------

------------------------
-- MOLTEN
------------------------
-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
-- vim.g.molten_auto_open_output = false
-- vim.g.molten_image_provider = 'image.nvim'
-- vim.g.molten_wrap_output = true
-- vim.g.molten_virt_text_output = true
-- this will make it so the output shows up below the \`\`\` cell delimiter
-- vim.g.molten_virt_lines_off_by_1 = true
-- HIGHLIGHTS
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorder', { link = 'FloatBorder' }) -- Link to FloatBorder
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorderFail', { link = 'ErrorMsg' }) -- Link to ErrorMsg
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorderSuccess', { link = 'Title' }) -- Link to Title
-- vim.api.nvim_set_hl(0, 'MoltenOutputWin', { link = 'NormalFloat' }) -- Link to NormalFloat
-- vim.api.nvim_set_hl(0, 'MoltenOutputWinNC', { link = 'NonText' }) -- Link to NonText
-- vim.api.nvim_set_hl(0, 'MoltenOutputFooter', { link = 'SpecialComment' }) -- Link to SpecialComment
-- vim.api.nvim_set_hl(0, 'MoltenCell', { link = 'CursorLine' }) -- Link to CursorLine
-- vim.api.nvim_set_hl(0, 'MoltenVirtualText', { link = 'Comment' }) -- Link to Comment
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorder', { link = 'FloatBorder' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorderFail', { link = 'ErrorMsg' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorderSuccess', { link = 'Title' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputWin', { link = 'NormalFloat' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputWinNC', { link = 'NonText' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputFooter', { link = 'SpecialComment' })
-- vim.api.nvim_set_hl(0, 'MoltenCell', { link = 'CursorLine' })
-- vim.api.nvim_set_hl(0, 'MoltenVirtualText', { link = 'Comment' })
-- vim.api.nvim_create_autocmd('FileType', {
-- pattern = { 'jupyter', 'markdown', 'ipynb', 'ipynb.md', 'md' }, -- Add markdown as well
-- callback = function()
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorder', { link = 'FloatBorder' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorderFail', { link = 'ErrorMsg' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputBorderSuccess', { link = 'Title' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputWin', { link = 'NormalFloat' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputWinNC', { link = 'NonText' })
-- vim.api.nvim_set_hl(0, 'MoltenOutputFooter', { link = 'SpecialComment' })
-- vim.api.nvim_set_hl(0, 'MoltenCell', { link = 'CursorLine' })
-- vim.api.nvim_set_hl(0, 'MoltenVirtualText', { link = 'Comment' })
-- end,
-- })
