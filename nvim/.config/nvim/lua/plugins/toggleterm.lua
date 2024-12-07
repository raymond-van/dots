return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      autochdir = true, -- Automatically set terminal directory to match Neovim's
      on_create = function(term)
        local conda_prefix = vim.env.CONDA_DEFAULT_ENV or ''
        if conda_prefix and conda_prefix ~= 'base' then
          local cmd = 'mma ' .. conda_prefix
          -- vim.fn.termopen(cmd)
          term:send(cmd, true)
        end
      end,
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
    }
  end,
}
