return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    -- unmap default f, F
    -- vim.keymap.set('n', 'f', ''),
    -- vim.keymap.set('x', 'f', ''),
    -- vim.keymap.set('o', 'f', ''),
    -- vim.keymap.set('n', 'F', ''),
    -- vim.keymap.set('x', 'F', ''),
    -- vim.keymap.set('o', 'F', ''),
    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump({continue = true}) end, desc = "Flash", nowait = true },
    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump({}) end, desc = "Flash", nowait = true },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump({}) end, desc = "Flash", },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },

    -- { "<Space>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "<Space>F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
