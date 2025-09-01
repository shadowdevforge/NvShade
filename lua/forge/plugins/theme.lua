return {
  "EdenEast/nightfox.nvim",
  lazy = false,    -- Need the theme to load immediately
  priority = 1000, -- Make sure it loads before any other plugin
  config = function()
    -- We'll default to 'duskfox', embodying the calm focus of NvShade.
    -- This can still be overridden by the user in `lua/forge/config.lua`.
    local config = require("forge.config")

    -- Use the safe getter functions
    local theme = config.get_theme()
    local transparent = config.get_transparent()

    -- Set up Nightfox
    require("nightfox").setup({
      options = {
        -- Transparent background can be enabled here or in the user config
        -- transparent = true,
      },
    })

    -- Load the colorscheme
    vim.cmd.colorscheme(theme)

    -- Set the background to dark, which is a good practice
    vim.opt.background = "dark"
  end,
}
