-- if true then return {} end
return {
  'anuvyklack/windows.nvim',
  -- 'JoseConseco/windows.nvim', -- with autowidth
  dependencies = {
    'anuvyklack/middleclass',
    'anuvyklack/animation.nvim',
  },
  config = function()
    require('windows').setup()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    -- Configuring windows.nvim to exclude the buvvers window
    ignore = {
      buftype = { 'quickfix', '[buvvers]', 'buvvers' },
      filetype = { 'NvimTree', 'neo-tree', 'undotree', 'gundo', 'buvvers', '[buvvers]' },
    }
  end,
}
