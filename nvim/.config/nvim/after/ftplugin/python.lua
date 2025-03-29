-- remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", { callback = function() local save_cursor = vim.fn.getpos(".") vim.cmd([[%s/\s+$//e]]) vim.fn.setpos(".", save_cursor) end, })
-- Map Shift+Enter to run a Python file
vim.keymap.set('n', '<S-CR>', function()
  local file = vim.fn.expand '%:p' -- Get the full path of the current file
  if vim.bo.filetype ~= 'python' then
    print 'Not a Python file!'
    return
  end
  vim.cmd 'write' -- Save the file
  vim.cmd('split | terminal python3 ' .. file)
end, { desc = 'Run Python file' })

-- vim.keymap.set("n", "<S-CR>", function()
-- local file = vim.fn.expand("%:p")
-- if vim.bo.filetype ~= "python" then
-- print("Not a Python file!")
-- return
-- end
-- require("toggleterm.terminal").Terminal:new({
-- cmd = "python3 " .. file,
-- direction = "float",
-- }):toggle()
-- end, { desc = "Run Python file in floating terminal" })
