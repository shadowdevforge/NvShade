-- ~/.config/nvim/lua/forge/plugins/ui.lua
return {
  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          -- We'll set the theme to 'auto' so it seamlessly adapts to synthweave
          -- or any other theme the user might choose in their config.
          theme = "auto",
          globalstatus = true,
          -- THE NEW SHARP SEPARATORS
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
        },

        sections = {
          -- LEFT SIDE
          lualine_a = {
            { "mode", separator = { right = "" } },
          },
          lualine_b = {
            "branch",
            "diff",
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
          },

          lualine_c = {
            {
              "filename",
              path = 1,
            },
          },

          -- RIGHT SIDE
          lualine_x = {
            "filetype",
          },
          lualine_y = {
            "progress",
          },
          lualine_z = {
            { function() return "󰽥 NvShade" end, separator = { left = "" } },
          },
        },

        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },
      })
    end,
  },
}
