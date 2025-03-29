return {
  'smjonas/inc-rename.nvim',
  opts = {
    vim.keymap.set('n', '<leader>rn', function()
      return ':IncRename '
      -- return ':IncRename ' .. vim.fn.expand '<cword>'
      end, { expr = true }),
    -- end),
  },
  -- config = function()
  -- require('inc_rename').setup {
  -- vim.keymap.set('n', '<leader>rn', ':IncRename '),
  -- }
  -- end,
}
