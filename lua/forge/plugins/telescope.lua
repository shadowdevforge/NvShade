-- ~/.config/nvim/lua/forge/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- Lazy-load on command
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- A modern, clean layout
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
        -- Use ascending order for sorting
        sorting_strategy = "ascending",
        -- Make the window opaque for focus
        winblend = 0,
        -- Add a custom prompt prefix for that NvShade feel
        prompt_prefix = "  ",
        selection_caret = " ",
        -- Custom keymaps for an enhanced experience
        mappings = {
          i = {
            -- Navigate results up/down
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            -- Scroll the preview window up/down
            ["<C-Down>"] = actions.preview_scrolling_down,
            ["<C-Up>"] = actions.preview_scrolling_up,
          },
        },
      },
    })

    
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set

    -- These mappings are the core of NvShade's navigation.
    -- Each one is mnemonic and powerful.
    map("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld Files" })
    map("n", "<leader>fc", builtin.git_commits, { desc = "[F]ind Git [C]ommits" })
  end,
}