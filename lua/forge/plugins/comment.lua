-- ~/.config/nvim/lua/forge/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  keys = {
    { "gac", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = "v", desc = "Comment toggle visual selection" },
    { "gbc", mode = "n", desc = "Comment toggle block" },
    { "gb", mode = "v", desc = "Comment toggle block" },
  },
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = nil,
    })
  end,
}
