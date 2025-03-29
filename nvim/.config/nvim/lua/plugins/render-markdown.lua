return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {
    -- Setup the plugin
    vim.api.nvim_set_hl(0, 'RenderMarkdownH1', { fg = '#DF807D' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#4d0000' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2', { fg = '#81B138' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#345E3B' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3', { fg = '#86C1D5' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#1A5FA4' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4', { fg = '#C599C8' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#6E57A8' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5', { fg = '#F2CDA0' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#B06B17' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH6', { fg = '#E9A749' }),
    vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#E3911C' }),
    -- Your existing configuration here
    border = true,
    border_virtual = true,
    render_modes = true,
    latex = { enabled = false },
    win_options = { conceallevel = { rendered = 2 } },
    -- file_types = { 'markdown', 'quarto' },
    --
  },
}
