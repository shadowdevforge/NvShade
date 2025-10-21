-- ~/.config/nvim/lua/forge/plugins/theme.lua
local theme = { 
-- Default theme

{ "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
    theme = "catppuccin-macchiato", -- The default theme for NvShade
  },
  config = function(_, opts)
    vim.cmd.colorscheme(opts.theme)
  end,
},

-- Other themes
{ "samharju/synthweave.nvim", lazy = false, priority = 1000,},
{ "EdenEast/nightfox.nvim", name = "nightfox", priority = 1000 },
{ "shaunsingh/nord.nvim", name = "nord", priority = 1000 },
}

return theme
