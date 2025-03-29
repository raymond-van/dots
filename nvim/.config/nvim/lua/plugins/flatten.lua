-- if true then
-- return {}
-- end
return {
  'willothy/flatten.nvim',
  -- or pass configuration with
  opts = {
    lazy = false,
    priority = 1001,
    integrations = {
      kitty = true,
    }
  },
  -- config = true,
  -- Ensure that it runs first to minimize delay when opening file from terminal
}
