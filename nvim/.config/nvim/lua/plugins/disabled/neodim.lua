if true then
  return {}
end
return {
  'zbirenbaum/neodim',
  event = 'LspAttach',
  config = function()
    require('neodim').setup {
      alpha = 0.70,
      blend_color = '#000000',
      hide = {
        underline = true,
        virtual_text = true,
        signs = true,
      },
      regex = {
        '[uU]nused',
        '[nN]ever [rR]ead',
        '[nN]ot [rR]ead',
      },
      priority = 128,
      disable = {},
    }
  end,
}
