-- ~/.config/nvim/lua/forge/plugins/init.lua
--
-- This file is the central manifest for all plugins.
-- It returns a list of plugin specifications that lazy.nvim will load.
-- Each plugin is defined in its own file under `lua/forge/plugins/`
-- for maintainability and modularity.

return {
  -- The foundational plugins that provide the look and feel of NvShade.
  require("forge.plugins.theme"),
  require("forge.plugins.ui"),

  -- Core functionality
  require("forge.plugins.telescope"),
  require("forge.plugins.treesitter"),
  require("forge.plugins.comment"),
  require("forge.plugins.autopairs"),
  
  -- Git integration
  require("forge.plugins.gitsigns"),

  -- Discoverability
  require("forge.plugins.which-key"),

  -- LSP & Tools Installer
  require("forge.plugins.mason"),

  -- Completion Engine
  require("forge.plugins.cmp"),

  -- Snippet Engine
  require("forge.plugins.luasnip"),

  -- Dashboard
  require("forge.plugins.alpha"),

  -- File Explorer
  require("forge.plugins.nvim-tree"),

  -- Bufferline
  require("forge.plugins.bufferline"),

}
