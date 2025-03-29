if true then return {} end
local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end
return {
  'kevinhwang91/nvim-ufo',
  deps = {
    'kevinhwang91/promise-async',
    'nvim-treesitter/nvim-treesitter',
  },
  init = function()
    vim.o.foldenable = true
    vim.o.foldcolumn = 'auto:9'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    -- vim.o.fillchars= 'eob: ,fold: ,foldopen: , foldsep:|,foldclose:>'
    vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep:│,foldclose:'
    vim.keymap.set('n', 'zA', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zC', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
    vim.keymap.set('n', 'Z', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        -- choose one of coc.nvim and nvim lsp
        -- vim.fn.CocActionAsync 'definitionHover' -- coc.nvim
        vim.lsp.buf.hover()
      end
    end)
  end,
  opts = {
    fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype, buftype)
      if filetype == 'markdown' then
        return '' -- Disable ufo for markdown
      end
      return { 'treesitter', 'indent' }
    end,
  },
}

-- return {
--   'kevinhwang91/nvim-ufo',
--   deps = {
--     'kevinhwang91/promise-async',
--     'nvim-treesitter/nvim-treesitter',
--   },
--   init = function()
-- --     vim.o.foldenable = true
-- --     vim.o.foldcolumn = 'auto:9'
-- --     vim.o.foldlevel = 99
-- --     vim.o.foldlevelstart = 99
-- --     -- vim.o.fillchars= 'eob: ,fold: ,foldopen: , foldsep:|,foldclose:>'
-- --     vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep:│,foldclose:'
--     vim.o.foldcolumn = '1' -- '0' is not bad
--     vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
--     vim.o.foldlevelstart = 99
--     vim.o.foldenable = true
--     vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep:│,foldclose:'
--     -- vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
--     vim.keymap.set('n', 'zA', require('ufo').openAllFolds, { desc = 'Open all folds' })
--     vim.keymap.set('n', 'zC', require('ufo').closeAllFolds, { desc = 'Close all folds' })
--     vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
--     vim.keymap.set('n', 'Z', function()
--       local winid = require('ufo').peekFoldedLinesUnderCursor()
--       if not winid then
--         -- choose one of coc.nvim and nvim lsp
--         -- vim.fn.CocActionAsync 'definitionHover' -- coc.nvim
--         vim.lsp.buf.hover()
--       end
--     end)
--   end,
--   config = function()
--     local ftMap = {
--       vim = 'indent',
--       python = { 'indent' },
--       git = '',
--     }
--     local handler = function(virtText, lnum, endLnum, width, truncate)
--       local newVirtText = {}
--       local suffix = (' 󰁂 %d '):format(endLnum - lnum)
--       local sufWidth = vim.fn.strdisplaywidth(suffix)
--       local targetWidth = width - sufWidth
--       local curWidth = 0
--       for _, chunk in ipairs(virtText) do
--         local chunkText = chunk[1]
--         local chunkWidth = vim.fn.strdisplaywidth(chunkText)
--         if targetWidth > curWidth + chunkWidth then
--           table.insert(newVirtText, chunk)
--         else
--           chunkText = truncate(chunkText, targetWidth - curWidth)
--           local hlGroup = chunk[2]
--           table.insert(newVirtText, { chunkText, hlGroup })
--           chunkWidth = vim.fn.strdisplaywidth(chunkText)
--           -- str width returned from truncate() may less than 2nd argument, need padding
--           if curWidth + chunkWidth < targetWidth then
--             suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
--           end
--           break
--         end
--         curWidth = curWidth + chunkWidth
--       end
--       table.insert(newVirtText, { suffix, 'MoreMsg' })
--       return newVirtText
--     end
--     require('ufo').setup {
--       enable_get_fold_virt_text = false,
--       fold_virt_text_handler = handler,
--       open_fold_hl_timeout = 150,
--       close_fold_kinds_for_ft = {
--         default = { 'imports', 'comment' },
--         json = { 'array' },
--         c = { 'comment', 'region' },
--       },
--       preview = {
--         win_config = {
--           border = { '', '─', '', '', '', '─', '', '' },
--           winhighlight = 'Normal:Folded',
--           winblend = 0,
--         },
--         mappings = {
--           scrollU = '<C-u>',
--           scrollD = '<C-d>',
--           jumpTop = '[',
--           jumpBot = ']',
--         },
--       },
--       provider_selector = function(bufnr, filetype, buftype)
--         -- if you prefer treesitter provider rather than lsp,
--         -- return ftMap[filetype] or { 'treesitter', 'indent' }
--         return ftMap[filetype]
--
--         -- refer to ./doc/example.lua for detail
--       end,
--     }
--   end,
-- }
