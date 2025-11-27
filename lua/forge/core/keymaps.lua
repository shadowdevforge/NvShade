-- ~/.config/nvim/lua/forge/core/keymaps.lua
--
-- The primary language for interacting with NV-Shade.
--
-- Philosophy:
--  - <Space> is the leader key. It's big and easy to press.
--  - Mnemonic groups: e.g., <leader>f for Find, <leader>g for Git.
--  - Ergonomics over tradition where it matters most.

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Set the leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 🌑 Core Editor Actions
--------------------------------------------------------------------------------
-- Save buffer
map({ "i", "n" }, "<C-s>", "<Cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save File" })

-- Easier Command
vim.keymap.set("n", ";", ":", { noremap = true })

-- Quit
map("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<Cmd>qa!<CR>", { desc = "Force Quit All" })

-- Fallback for Normal Mode
vim.api.nvim_set_keymap('i', '\\', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '\\', '<Esc>', { noremap = true, silent = true })

-- 🌑 Navigation and Window Management
--------------------------------------------------------------------------------
-- Switch between windows with Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Buffer navigation
map("n", "<S-L>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-H>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Close current buffer" })

-- Resize windows
map("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Resize window smaller" })
map("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Resize window larger" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize window narrower" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize window wider" })

-- 🌑 Quality of Life
--------------------------------------------------------------------------------
-- Clear search highlighting
map("n", "<leader><space>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Make 'Y' behave like 'D' and 'C' (yank to end of line)
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- Easier to leave terminal
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Copy to clipboard
map("v", "<leader>y", '"+y', { desc = "Copy to Clipboard" })
map("n", "<leader>yy", '"+yy', { desc = "Copy Line to Clipboard" })

-- Keep the cursor in place when joining lines
map("n", "J", "mzJ`z")

-- Center the screen on the cursor for next/previous search result
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


