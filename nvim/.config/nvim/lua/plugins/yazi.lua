return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      '<leader>-',
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      -- Open in the current working directory
      '<leader>cw',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file manager in nvim's working directory",
    },
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      '<c-up>',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  config = function()
    require('yazi').setup {
      -- enable this if you want to open yazi instead of netrw.
      -- Note that if you enable this, you need to call yazi.setup() to
      -- initialize the plugin. lazy.nvim does this for you in certain cases.
      --
      -- If you are also using neotree, you may prefer not to bring it up when
      -- opening a directory:
      {
        'nvim-neo-tree/neo-tree.nvim',
        opts = {
          filesystem = {
            hijack_netrw_behavior = 'true',
          },
        },
      },
      open_for_directories = true,
      -- open visible splits as yazi tabs for easy navigation. Requires a yazi
      -- version more recent than 2024-08-11
      -- https://github.com/mikavilpas/yazi.nvim/pull/359
      open_multiple_tabs = true,
      -- log_level = vim.log.levels.DEBUG,
      keymaps = {
        show_help = '<f1>',
      },
    }
  end,
}
