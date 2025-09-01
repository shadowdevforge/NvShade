-- ~/.config/nvim/lua/forge/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  version = "*", -- Always grab the latest stable
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons", -- required for icons
  },
  config = function()
    local wk = require("which-key")

    -- timeout for key combos
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    wk.setup({
      icons = {
        mappings = true,
        rules = true,
      },
      win = {
        border = "rounded",
      },
    })

    -- Example keymaps
    wk.add({
  { "<leader>f", group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  })

  end,
}
