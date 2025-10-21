return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons", -- required for icons
  },
  config = function()
    -- Set the timeout for leader keys
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")
    wk.setup({
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "→",
        group = "+",
      },
      win = {
        border = "rounded",
        padding = { 1, 2, 1, 2 },
      },
    })
  end,
}
