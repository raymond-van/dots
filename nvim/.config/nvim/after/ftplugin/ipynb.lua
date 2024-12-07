-- -- file: nvim/ftplugin/markdown.lua
--require('quarto').activate()
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
