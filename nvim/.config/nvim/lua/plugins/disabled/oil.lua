if true then return {} end
vim.keymap.set('n', '<C-->', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = false,
  },
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
