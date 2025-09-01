-- ~/.config/nvim/lua/forge/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        -- Use modern, slanted separators
        separator_style = "slant",
        -- Show LSP diagnostics in the buffer tabs
        diagnostics = "nvim_lsp",
        -- Always show the bufferline, even with one buffer
        always_show_bufferline = false,
        -- This is the magic ingredient for a seamless UI with nvim-tree
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    })

    -- Keymaps for buffer navigation (these complement the ones in core/keymaps.lua)
    local map = vim.keymap.set
    map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
    map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
  end,
}