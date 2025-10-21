return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {"catppuccin", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha", "nord",
        "nightfox", "duskfox", "nordfox", "terafox", "carbonfox", "dawnfox", "dayfox",
        "synthweave", "synthweave-transparent",}, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end
}
