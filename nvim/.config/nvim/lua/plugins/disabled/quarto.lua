if true then
  return {}
end
-- plugins/quarto.lua
return {
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvimtools/hydra.nvim',
    },
    opts = {
      lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { 'python', 'rust', 'julia' },
        chunks = 'all',
        diagnostics = {
          enabled = true,
          triggers = { 'BufWritePost' },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        -- NOTE: setup your own keymaps:
        hover = 'H',
        definition = 'gd',
        rename = '<leader>rn',
        references = 'gr',
        format = '<leader>gf',
      },
      codeRunner = {
        enabled = true,
        default_method = 'molten',
      },
    },
  },
}
