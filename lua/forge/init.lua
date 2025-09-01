-- ~/.config/nvim/lua/forge/init.lua
--
-- This is the main conductor for the NV-Shade configuration.
-- It requires the different modules of our config in a logical order.
--
-- 1. Core:       Set editor options first. These are fundamental.
-- 2. Plugins:    Loaded automatically by lazy.nvim from the init.lua.
-- 3. Keymaps:    Define keybindings. Can map to plugin functions.
-- 4. LSP:        Configure language servers and tools.
-- 5. Autocmds:   Run commands on specific events.

-- Load core editor settings
require("forge.core.options")

-- Load keybindings
require("forge.core.keymaps")

-- Load autocommands
require("forge.core.autocmds")

-- Load LSP settings
require("forge.lsp")