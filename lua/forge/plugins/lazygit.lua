-- ~/.config/nvim/lua/forge/plugins/lazygit.lua
return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit", -- Lazy-load on command
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- Register the keymap with which-key for consistency.
    local wk = require("which-key")
    wk.register({
      ["<leader>g"] = {
        g = { "<cmd>LazyGit<CR>", "LazyGit" },
      },
    })
  end,
}