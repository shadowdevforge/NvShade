-- ~/.config/nvim/lua/forge/core/options.lua
--
-- The foundational settings for NvShade.
-- This is where the editor's core behavior is forged.

local opt = vim.opt -- For convenience

-- 🌑 General Editor Behavior
--------------------------------------------------------------------------------
opt.mouse = "a" -- Enable mouse support in all modes
opt.clipboard = "unnamedplus" -- Use the system clipboard for all yank/delete/put operations
opt.swapfile = false -- Use modern source control; swapfiles are an annoyance

-- Persist undo history
opt.undofile = true
local undodir_path = vim.fn.stdpath("data") .. "/undodir"
opt.undodir = undodir_path
-- We use the simple string variable directly, which is safe
vim.fn.mkdir(undodir_path, "p")

opt.completeopt = { "menuone", "noselect" } -- Autocomplete options
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ...unless the query contains uppercase letters
opt.shortmess:append("c") -- Don't show redundant messages from completion

-- 🌑 UI and Appearance
--------------------------------------------------------------------------------
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers for easier vertical navigation
opt.cursorline = true -- Highlight the current line
opt.signcolumn = "yes" -- Always show the sign column to prevent layout shifts
opt.scrolloff = 8 -- Keep 8 lines of context around the cursor when scrolling
opt.sidescrolloff = 8 -- Keep 8 columns of context around the cursor when scrolling sideways

opt.splitright = true -- New vertical splits go to the right
opt.splitbelow = true -- New horizontal splits go to the bottom

opt.pumheight = 10 -- Pop-up menu height
opt.showmode = false -- We have a statusline, we don't need to see --INSERT--

-- 🌑 Tabs, Indentation, and Text Formatting
--------------------------------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces a <Tab> in the file counts for
opt.softtabstop = 2 -- Number of spaces to insert for a <Tab>
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.smartindent = true -- Be smart about indentation

opt.wrap = false -- Do not wrap lines
opt.linebreak = true -- Wrap lines at convenient points (if wrap is on)

-- 🌑 Performance and Internals
--------------------------------------------------------------------------------
opt.hidden = true -- Allow switching buffers without saving
opt.updatetime = 300 -- Faster completion and gitsigns 
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in ms)
opt.laststatus = 3 -- Always display the status line
