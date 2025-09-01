-- ~/.config/nvim/lua/forge/plugins/ui.lua
return {
  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- Statusline
{
  "nvim-lualine/lualine.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons", "EdenEast/nightfox.nvim" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "nightfox",                -- let theme drive colors
        globalstatus = true,
        component_separators = { left = "●", right = "●" }, -- circle dots
        section_separators   = { left = "", right = "" }, -- smooth curves
        disabled_filetypes   = {},
      },

      sections = {
        -- LEFT
        lualine_a = {
          { "mode", icon = "", separator = { right = "" } },
        },
        lualine_b = {
          {
            "filename",
            path = 0,
            symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
          },
          { "branch", icon = "" },
        },

        -- MIDDLE
        lualine_c = {
          { function() return "󰽥 NvShade" end, separator = { right = "" }, padding = { left = 1, right = 1 } },
        },

        -- RIGHT
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
            separator = { left = "" },
            padding = 1,
          },
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              return next(clients) and clients[1].name or "No LSP"
            end,
            icon = "",
            separator = { left = "" },
            padding = 1,
          },
          
          { "progress", icon = "" },
        },
        lualine_y = {
        {
          function()
            return os.date("%H:%M") -- 24h format
          end,
          icon = " ", -- clock icon
        },
      },
        lualine_z = {},
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = { "filename" },
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
},
}
