if true then return {} end
return {
  'GCBallesteros/jupytext.nvim',
  config = function()
    require('jupytext').setup {
      style = 'markdown',
      output_extension = 'md',
      force_ft = 'markdown',
    }
  end,
  -- config = function ()
  -- local style = "markdown"
  -- local output_extension = "md"
  -- local force_ft = "markdown"
  -- end
  --
  -- Depending on your nvim distro or config you may need to make the loading not lazy
  -- lazy=false,
}
