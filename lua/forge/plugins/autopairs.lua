-- ~/.config/nvim/lua/forge/plugins/autopairs.lua
return {
  "windwp/nvim-autopairs",
  -- Load this plugin when we enter insert mode
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true, -- Use treesitter to check for context
      ts_config = {
        lua = { "string" }, -- Don't add pairs inside of a string
        javascript = { "template_string" },
        java = false, -- Disable for java
      },
    })

    -- This is a critical integration for a smooth completion experience.
    -- It ensures that nvim-cmp and nvim-autopairs play nicely together.
    -- When cmp provides a completion with parentheses, autopairs won't add another pair.
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}