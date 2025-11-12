-- ~/.config/nvim/lua/forge/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  -- Define the default options using the `opts` key
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
      },
      sorting_strategy = "ascending",
      winblend = 0,
      prompt_prefix = "  ",
      selection_caret = " ",
      },
    },
  },
  -- The config function now receives the final, merged options
  config == function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    -- Keymaps remain the same
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    map("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld Files" })
    map("n", "<leader>fc", builtin.git_commits, { desc = "[F]ind Git [C]ommits" })
end
