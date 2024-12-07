return {
  name = 'just',
  builder = function(params)
    local task = params.task
    -- Full path to current file (see :help expand())
    -- local path = vim.fn.expand '%:p'
    local file_path = vim.fn.expand '%:p:h'
    local file_name = vim.fn.expand '%:t' -- file name
    -- local target = vim.fn.expand '%:t:r'
    -- local src = vim.fn.expand '%:r' -- file name no ext
    -- local just_path = '--jumpfile ~/dots/.config/just/justfile'
    return {
      cmd = { 'just', },
      args = { '-g', task, file_path, file_name },
      components = { { 'on_output_quickfix', open = true }, 'default' },
    }
  end,
  condition = {
    filetype = { 'cpp' },
  },
}
--
-- return {
-- name = 'C++ Justfile Tasks',
-- builder = function(params)
-- Determine the current file and directory
-- local file_name = vim.fn.expand '%:t'
-- local src = vim.fn.expand '%:p'
-- local file_dir = vim.fn.expand '%:p:h'
-- local target = vim.fn.expand '%:t:r'

-- print 'cpp.cpp_just template invoked'

-- Choose the Just task based on parameters
-- local task_name = params.task_name or 'build' -- Default task is build
-- return {
-- cmd = 'just build ' .. src,
-- args = { task_name, src},
-- cwd = file_dir,
-- env = {
-- SRC = 'main.cpp',
-- TARGET = 'out',
-- },
-- name = 'Just: ' .. task_name,
-- components = { { 'on_output_quickfix', open = true }, 'default' },
-- }
-- end,
-- params = {
-- task_name = {
-- type = 'string',
-- default = 'build',
-- description = 'Task to run from Justfile (build, run, clean)',
-- },
-- },
-- priority = 50,
-- condition = {
-- filetype = { 'cpp' }, -- Only enable for C++ files
-- },
-- }
