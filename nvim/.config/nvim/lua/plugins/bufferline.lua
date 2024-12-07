return {
  'akinsho/bufferline.nvim',
  version = '*',
  opts = {
    options = {
      numbers = 'none',
      close_command = 'bdelete! %d', -- Close buffer command
      middle_mouse_command = 'bdelete! %d', -- Right-click to close buffer
      left_mouse_command = 'buffer %d', -- Left-click to open buffer
      --      middle_mouse_command = ':BufferLineTogglePin', -- Left-click to open buffer
      show_buffer_icons = true, -- Display filetype icons
      show_buffer_close_icons = true, -- Display close icons
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
      diagnostics = 'nvim_lsp', -- Show LSP diagnostics
    },
  },
}
