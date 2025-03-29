function _G.get_conda_env()
  local conda_env = os.getenv 'CONDA_DEFAULT_ENV' -- Get the current Conda environment prefix
  if conda_env then
    -- Extract just the environment name from the full path (assuming the env is at the end of the path)
    local env_name = conda_env:match '([^/\\]+)$'
    return '🐍 ' .. env_name -- Return the environment name with the snake emoji
  else
    -- If no conda environment is active, activate the base environment or a specific one
    local env_to_activate = 'base' -- You can specify another environment name here if you prefer
    os.execute('mamba activate ' .. env_to_activate) -- Activate the mamba environment
    -- You can choose to either return a placeholder or check the environment again
    local new_conda_env = os.getenv 'CONDA_DEFAULT_ENV'
    if new_conda_env then
      local new_env_name = new_conda_env:match '([^/\\]+)$'
      return '🐍 ' .. new_env_name -- Return the newly activated environment name
    else
      return '🐍' -- If no environment could be activated, just return the emoji
    end
  end
end
--
--
return {
  'nvim-lualine/lualine.nvim', -- Specify the plugin repository
  dependencies = { 'kyazdani42/nvim-web-devicons' }, -- Optional, for icons
  config = function()
    -- Define your lualine configuration here
    require('lualine').setup {
      options = {
        ignore_focus = { '*' }, -- This will make all unfocused windows have empty statuslines
        icons_enabled = true,
        theme = 'palenight', -- Replace with your preferred theme
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true, -- Add this line to enable global statusline
        disabled_filetypes = {
          statusline = { '%' }, -- Add this line to disable statusline for inactive windows
          winbar = {},
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          function()
            return _G.get_conda_env()
          end,
          'branch',
          'diff',
          'diagnostics',
        },
        lualine_c = { { 'filename', path = 3 } },
        lualine_x = {
          --          'encoding',
          --          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        -- lualine_c = { 'filename' },
        -- lualine_x = { 'location' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }
  end,
}
