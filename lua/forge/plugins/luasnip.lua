-- ~/.config/nvim/lua/forge/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}