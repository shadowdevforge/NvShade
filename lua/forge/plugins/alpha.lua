-- ~/.config/nvim/lua/forge/plugins/alpha.lua
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- NvShade ASCII Art Header
    dashboard.section.header.val = {
            "",
            "",
            "",
            "",        
            " ██████   █████              █████████  █████                    █████         ",
            "░░██████ ░░███              ███░░░░░███░░███                    ░░███          ",
            " ░███░███ ░███  █████ █████░███    ░░░  ░███████    ██████    ███████   ██████ ",
            " ░███░░███░███ ░░███ ░░███ ░░█████████  ░███░░███  ░░░░░███  ███░░███  ███░░███",
            " ░███ ░░██████  ░███  ░███  ░░░░░░░░███ ░███ ░███   ███████ ░███ ░███ ░███████ ",
            " ░███  ░░█████  ░░███ ███   ███    ░███ ░███ ░███  ███░░███ ░███ ░███ ░███░░░  ",
            " █████  ░░█████  ░░█████   ░░█████████  ████ █████░░████████░░████████░░██████ ",
            "░░░░░    ░░░░░    ░░░░░     ░░░░░░░░░  ░░░░ ░░░░░  ░░░░░░░░  ░░░░░░░░  ░░░░░░  ",
            "",                                                                   
            "",                                                                   
            "", 
    }
    dashboard.section.header.opts.hl = "Function" -- Use a nice highlight group

    -- Mnemonic keybindings for discoverability
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", "<Cmd>Telescope find_files<CR>"),
      dashboard.button("n", "  New File", "<Cmd>enew<CR>"),
      dashboard.button("e", "󰉋  File Explorer", "<Cmd>NvimTreeOpen<CR>"),
      dashboard.button("o", "  Recent Files", "<Cmd>Telescope oldfiles<CR>"),
      dashboard.button("u", "  Help Uganda", "<Cmd>help iccf<CR>"),
      dashboard.button("q", "  Quit Nvim", "<Cmd>qa<CR>"),
      dashboard.button("", "------------------------------------------------------------------"),
    }

-- Display startup stats (but defer until Lazy finishes)
local stats = require("lazy").stats()
dashboard.section.footer.val = string.format(
  "⚡ NvShade forged with %d plugins in %.2fms",
  stats.count,
  stats.startuptime
)

dashboard.section.footer.opts.hl = "Comment"

-- Update footer after Lazy has finished
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    dashboard.section.footer.val = string.format(
      "⚡ NvShade forged with %d plugins in %.2fms",
      stats.count,
      stats.startuptime
    )
    pcall(vim.cmd.AlphaRedraw)
  end,
})

    
    dashboard.section.footer.opts.hl = "Comment"

    -- Apply the configuration
    alpha.setup(dashboard.opts)
  end,
}