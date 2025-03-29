if true then return {} end
return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    -- " Viewer options: One may configure the viewer either by specifying a built-in
    -- " viewer method:
    vim.g.vimtex_view_method = 'zathura'
    -- " Or with a generic interface:
    vim.g.vimtex_view_general_viewer = 'okular'
    -- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
    -- " Most VimTeX mappings rely on localleader and this can be changed with the
    -- " following line. The default is usually fine and is the symbol "\".
    -- let maplocalleader = ",",
    --
    -- Enable for Markdown files
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_syntax_conceal_disable = 1
    -- require('vimtex').setup()
  end,
  -- config = function()
  --   -- Additional configuration if needed
  --   vim.cmd [[
  --     augroup VimTeX
  --       autocmd!
  --       autocmd FileType tex,markdown VimtexCompile
  --     augroup END
  --   ]]
  -- end,
  ft = { 'tex', 'markdown' }, -- Load for TeX and Markdown files
  -- opts = {},
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  --   opts = {
  --     latex = { enabled = false },
  --     win_options = { conceallevel = { rendered = 2 } },
  --   },
  -- },
}
