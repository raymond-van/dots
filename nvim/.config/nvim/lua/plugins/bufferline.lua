-- if true then return {} end
return {
  'akinsho/bufferline.nvim',
  version = '5726c4',
  updates = false,
  opts = {
    options = {
      numbers = 'none',
      close_command = 'bdelete! %d', -- Close buffer command
      right_mouse_command = 'bd! %d', -- Right-click to close buffer
      left_mouse_command = 'buffer %d', -- Left-click to open buffer
      --      middle_mouse_command = ':BufferLineTogglePin', -- Left-click to open buffer
      show_buffer_icons = true, -- Display filetype icons
      show_buffer_close_icons = false, -- Display close icons
      separator_style = 'slope', -- Buffer separators
      groups = {
        -- items = {
        -- require('bufferline.groups').builtin.pinned:with { icon = '󰐃 ' },
        -- },
      },
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File explorer',
          text_align = 'center',
          highlight = 'Directory',
          separator = true, -- use a "true" to enable the default, or set your own character
        },
      },
      -- sort_by = 'extension' | 'relative_directory' | 'directory'
      sort_by = 'extension',
      -- sort by = function(buffer_a, buffer_b)
      --     local modified_a = vim.fn.getftime(buffer_a.path)
      --     local modified_b = vim.fn.getftime(buffer_b.path)
      --     return modified_a > modified_b
      -- end,
      diagnostics = 'nvim_lsp', -- Show LSP diagnostics
    },
  },
}
