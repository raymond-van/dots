-- if true then
-- return {}
-- end
return {
  'willothy/flatten.nvim',
  -- or pass configuration with
  -- opts = {  }
  -- Ensure that it runs first to minimize delay when opening file from terminal
  config = true,
  lazy = false,
  priority = 1001,
}
