--
-- The entry point for NV-Shade.
--
-- This file is intentionally minimal. Its only job is to bootstrap `lazy.nvim`
-- and then delegate all configuration to the far more organized `lua/forge/` directory.
-- All the magic happens there.

-- =============================================================================
-- Bootstrap lazy.nvim
-- =============================================================================
-- This section ensures that the `lazy.nvim` plugin manager is installed automatically
-- if it's not already present.

vim.g.maplocalleader = " "
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- Setup NvShade
-- =============================================================================
-- Now that lazy.nvim is guaranteed to be available, I can use it to set up
-- the rest of our configuration.
--
-- I point lazy to our `plugins` module within our custom `forge` directory.
-- lazy.nvim will automatically find and load the plugin specifications from
-- `lua/forge/plugins/`.

require("lazy").setup({
  spec = {
    -- The location of our plugin specifications
    { import = "forge.plugins" },
  },
  -- lazy.nvim options can be configured here.
  -- For now, I'll keep the defaults, which is already excellent.
  -- Example:
  -- change_detection = {
  --   enabled = true,
  --   notify = false, -- Don't notify me about changes, I'll check manually.
  -- },
})

-- =============================================================================
-- Load the rest of the configuration
-- =============================================================================
-- With the plugin manager set up, we now load the core of NvShade.
-- The `forge` module will handle setting options, keymaps, autocommands,
-- and loading the LSP configuration in the correct order.

require("forge")
