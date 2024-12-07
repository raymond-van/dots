-- file: nvim/ftplugin/markdown.lua
require('quarto').activate()
local runner = require 'quarto.runner'
vim.keymap.set('n', '<localleader>r', runner.run_cell, { desc = 'run cell', silent = true })
vim.keymap.set('n', '<localleader>ma', runner.run_all, { desc = 'run all cells', silent = true })
vim.keymap.set('n', '<localleader>ml', runner.run_line, { desc = 'run line', silent = true })
-- vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
-- vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
-- vim.keymap.set("n", "<localleader>RA", function()
-- runner.run_all(true)
-- end, { desc = "run all cells of all languages", silent = true })
--
-- HIGHLIGHTS
vim.api.nvim_set_hl(0, 'MoltenOutputBorder', { link = 'FloatBorder' }) -- Link to FloatBorder
vim.api.nvim_set_hl(0, 'MoltenOutputBorderFail', { link = 'ErrorMsg' }) -- Link to ErrorMsg
vim.api.nvim_set_hl(0, 'MoltenOutputBorderSuccess', { link = 'Title' }) -- Link to Title
vim.api.nvim_set_hl(0, 'MoltenOutputWin', { link = 'NormalFloat' }) -- Link to NormalFloat
vim.api.nvim_set_hl(0, 'MoltenOutputWinNC', { link = 'NonText' }) -- Link to NonText
vim.api.nvim_set_hl(0, 'MoltenOutputFooter', { link = 'SpecialComment' }) -- Link to SpecialComment
vim.api.nvim_set_hl(0, 'MoltenCell', { link = 'CursorLine' }) -- Link to CursorLine
vim.api.nvim_set_hl(0, 'MoltenVirtualText', { link = 'Comment' }) -- Link to Comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown', -- Apply to markdown filetypes
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