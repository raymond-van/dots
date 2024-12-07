if true then
  return {}
end
return {
  'nvimtools/hydra.nvim',
  config = function()
    -- create hydras in here
    local function keys(str)
      return function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), 'm', true)
      end
    end

    local hydra = require 'hydra'
    hydra {
      name = 'QuartoNavigator',
      hint = [[
            _j_/_k_: move down/up  _r_: run cell
            _l_: run line  _R_: run above
            ^^     _<esc>_/_q_: exit ]],
      config = {
        color = 'pink',
        invoke_on_body = true,
        hint = {
          -- border = 'rounded', -- you can change the border if you want
        },
      },
      mode = { 'n' },
      body = '<localleader>j', -- this is the key that triggers the hydra
      heads = {
        { 'j', keys ']b' },
        { 'k', keys '[b' },
        { 'r', ':QuartoSend<CR>' },
        { 'l', ':QuartoSendLine<CR>' },
        { 'R', ':QuartoSendAbove<CR>' },
        { '<esc>', nil, { exit = true } },
        { 'q', nil, { exit = true } },
      },
    }
  end,
}
