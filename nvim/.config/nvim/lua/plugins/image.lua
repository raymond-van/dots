return {
  '3rd/image.nvim',
  version = '1.1.0',
  opts = {
    rocks = {
      hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
    },
    backend = 'kitty', -- Kitty will provide the best experience, but you need a compatible terminal
    --   max_width = 100, -- tweak to preference
    --   max_height = 12, -- ^
    --   max_height_window_percentage = math.huge, -- this is necessary for a good experience
    --    max_width_window_percentage = math.huge,
    --    window_overlap_clear_enabled = true,
    --    window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
  },
}