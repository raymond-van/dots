if true then
  return {}
end
return {
  'aidancz/buvvers.nvim',
  -- dependencies = { 'echasnovski/mini.nvim', },
  opts = {
    buvvers_buf_name = '[buvvers]',
    -- buvvers buffer name displayed on status line
    buvvers_buf_opt = {
      -- buvvers buffer local options
    },
    buvvers_win = {
      -- the `config` parameter of `vim.api.nvim_open_win`
      win = -1,
      split = 'right',
      width = math.ceil(vim.o.columns / 8),
      style = 'minimal',
    },
    buvvers_win_opt = {
      -- buvvers window local options
      wrap = true,
      winfixwidth = true,
      winfixheight = true,
      winfixbuf = true,
    },
    highlight_group_current_buffer = 'Visual',
    -- inside buvvers buffer, the current buffer is highlighted with this highlight group
    buffer_handle_list_to_buffer_name_list = function(handle_l)
      -- this is the core function of buvvers, see details below
      local name_l

      local default_function = require 'buvvers.buffer_handle_list_to_buffer_name_list'
      name_l = default_function(handle_l)

      return name_l
    end,
  },
  config = function()
    require('mini.icons')
    require('buvvers').setup {
      buffer_handle_list_to_buffer_name_list = function(handle_l)
        local name_l
        local default_function = require 'buvvers.buffer_handle_list_to_buffer_name_list'
        name_l = default_function(handle_l)
        for n, name in ipairs(name_l) do
          local icon, hl = MiniIcons.get('file', name)
          name_l[n] = {
            { icon .. ' ', hl },
            name,
          }
        end
        return name_l
      end,
    }
    vim.keymap.set('n', '<C-b>', require('buvvers').toggle)
    -- use "BuvversAttach" to add a autocmd that refresh buvvers when BufModifiedSet event is triggered
    local buvvers_customize = function()
      vim.keymap.set('n', 'd', function()
        local cursor_buf_handle = require('buvvers').buvvers_buf_get_buf(vim.fn.line '.')
        MiniBufremove.delete(cursor_buf_handle, false)
      end, {
        buffer = require('buvvers').buvvers_get_buf(),
        nowait = true,
      })
      vim.keymap.set('n', 'o', function()
        local cursor_buf_handle = require('buvvers').buvvers_buf_get_buf(vim.fn.line '.')
        local previous_win_handle = vim.fn.win_getid(vim.fn.winnr '#')
        -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/0b44040ec7b8472dfc504bbcec735419347797ad/lua/neo-tree/utils/init.lua#L643
        vim.api.nvim_win_set_buf(previous_win_handle, cursor_buf_handle)
        vim.api.nvim_set_current_win(previous_win_handle)
      end, {
        buffer = require('buvvers').buvvers_get_buf(),
        nowait = true,
      })
    end
    vim.api.nvim_create_autocmd('User', {
      group = vim.api.nvim_create_augroup('buvvers_customize', { clear = true }),
      pattern = 'BuvversAttach',
      callback = buvvers_customize,
    })

    require('buvvers').open()
    -- enable buvvers at startup

    -- vim.api.nvim_create_autocmd('User', {
    --   group = vim.api.nvim_create_augroup('buvvers_keymap', { clear = true }),
    --   pattern = 'BuvversAttach',
    --   callback = function()
    --     vim.keymap.set('n', 'd', function()
    --       local current_buf_handle = require('buvvers').get_current_buf_handle()
    --       MiniBufremove.delete(current_buf_handle, false)
    --     end, {
    --       buffer = require('buvvers').get_buvvers_buf_handle(),
    --       nowait = true,
    --     })
    --     vim.keymap.set('n', 'o', function()
    --       local current_buf_handle = require('buvvers').get_current_buf_handle()
    --       local previous_win_handle = vim.fn.win_getid(vim.fn.winnr '#')
    --       -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/0b44040ec7b8472dfc504bbcec735419347797ad/lua/neo-tree/utils/init.lua#L643
    --       vim.api.nvim_win_set_buf(previous_win_handle, current_buf_handle)
    --       vim.api.nvim_set_current_win(previous_win_handle)
    --     end, {
    --       buffer = require('buvvers').get_buvvers_buf_handle(),
    --       nowait = true,
    --     })
    --
    --     -- Bind <leader>-1 to <leader>-9 to open buffers 1 through 9
    --     for i = 1, 9 do
    --       vim.keymap.set('n', '<C-' .. i .. '>', function()
    --         local buffers = vim.api.nvim_list_bufs() -- Get list of buffers
    --         if buffers[i] then -- Check if the buffer exists at that index
    --           -- Open buffer in the correct window if it's the "buvvers" window
    --           local buvvers_buf_handle = require('buvvers').get_buvvers_buf_handle()
    --           local buvvers_win = require('buvvers').get_buvvers_win_handle()
    --           if buvvers_buf_handle and buvvers_win then
    --             vim.api.nvim_set_current_buf(buffers[i]) -- Set the buffer in the current window
    --             -- You can optionally make sure that the `buvvers` window and buffer are correctly focused:
    --             vim.api.nvim_set_current_win(buvvers_win)
    --           else
    --             -- If no specific window exists, set the current buffer normally
    --             vim.api.nvim_set_current_buf(buffers[i])
    --           end
    --         else
    --           print('Buffer ' .. i .. ' does not exist.')
    --         end
    --       end, {
    --         buffer = require('buvvers').get_buvvers_buf_handle(),
    --         nowait = true,
    --       })
    --     end
    --   end,
    -- })
  end,
  -- vim.api.nvim_create_autocmd('BufWinEnter', {
  --   pattern = '[buvvers]', -- Match the buvvers buffer
  --   callback = function()
  -- local buvvers_win = vim.api.nvim_get_current_win()
  -- vim.api.nvim_win_set_option(buvvers_win, 'winfixwidth', true)
  -- vim.api.nvim_win_set_option(buvvers_win, 'winfixheight', true)
  --   end,
  -- }),
  -- change the prefix decided by [mini.icons](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-icons.md)
  --
}
