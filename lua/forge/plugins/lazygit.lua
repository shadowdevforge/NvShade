return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit", -- Lazy-load on command
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- Define the keymap directly here. `which-key` will automatically pick it up
    -- and place it under the "+Git" group defined in gitsigns.lua.
    { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
  },

}
