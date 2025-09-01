-- ~/.config/nvim/lua/forge/plugins/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      -- All the defaults are excellent.
    })

    -- Forge our Git keymap menu using which-key for discoverability
    local wk = require("which-key")
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
  { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame Line" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff This" },
  { "<leader>gD", "<cmd>Gitsigns diffthis ~<CR>", desc = "Diff This ~" },
})
    -- Keymaps for navigating hunks
    local map = vim.keymap.set
    map("n", "]c", function() gitsigns.next_hunk() end, { desc = "Next Git Hunk" })
    map("n", "[c", function() gitsigns.prev_hunk() end, { desc = "Previous Git Hunk" })
  end,
}
