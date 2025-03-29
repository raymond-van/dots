return {
  'HakonHarnes/img-clip.nvim',
  event = 'VeryLazy',
  opts = {
    default = {
      use_absolute_path = false, ---@type boolean
      relative_to_current_file = true, ---@type boolean
      -- I want to save the images in a directory named after the current file,
      -- but I want the name of the dir to end with `-img`
      -- dir_path = function()
      --   return vim.fn.expand '%:t:r' .. '-img'
      -- end,
      prompt_for_file_name = false, ---@type boolean

      file_name = function()
        return vim.fn.expand('%:t:r'):gsub(' ', '') .. '-%Y-%m-%d-%H-%M-%S'
      end,
      show_dir_path_in_prompt = false, ---@type boolean | fun(): boolean
      extension = 'png', ---@type string
      -- process_cmd = 'convert - -quality 75 png:-', ---@type string
      -- embed_image_as_base64 = true,
      -- process_cmd = 'convert - -quality 10 png:-', -- compress the image with 85% quality
      process_cmd = "convert - -define png:compression-level=9 png:-"

    },
    filetypes = {
      markdown = {
        url_encode_path = true, ---@type boolean
        -- -- The template is what specifies how the alternative text and path
        -- -- of the image will appear in your file
        -- -- $CURSOR will paste the image and place your cursor in that part so
        -- -- you can type the "alternative text", keep in mind that this will
        -- -- not affect the name that the image physically has
        template = '![Image]($FILE_PATH)', ---@type string
        -- -- This will dynamically configure the alternative text to show the
        -- -- same that you configured as the "file_name" above
        -- template = '![$FILE_NAME]($FILE_PATH)', ---@type string
      },
    },
  },
  keys = {
    -- suggested keymap
    { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
  },
}
-- opts = {
--   prompt_for_file_name = false, ---@type boolean | fun(): boolean
--   show_dir_path_in_prompt = true, ---@type boolean | fun(): boolean
--   -- or leave it empty to use the default settings
--   file_name = '$FILE_NAME_NO_EXT-%Y-%m-%d-%H-%M-%S', ---@type string | fun(): string
-- },
-- keys = {
--   -- suggested keymap
--   { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
-- },
