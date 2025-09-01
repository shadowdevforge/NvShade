-- ~/.config/nvim/lua/forge/core/keymaps.lua
--
-- The primary language for interacting with NV-Shade.
--
-- Philosophy:
--  - <Space> is the leader key. It's big and easy to press.
--  - Mnemonic groups: e.g., <leader>f for Find, <leader>g for Git.
--  - Ergonomics over tradition where it matters most.

-- A helper function to make defining keymaps cleaner
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
map("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save File" })
map("n", "<C-s>", ":w<CR>", { desc = "Save File" })
map("n", "<leader>w", ":w<CR>", { desc = "Save File" })

-- Easier Command
vim.keymap.set("n", ";", ":", { noremap = true })

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "Force Quit All" })

-- A more ergonomic escape from insert mode
-- map("i", "jk", "<ESC>") -- This is personal preference, uncomment if you like it

-- 🌑 Navigation and Window Management
--------------------------------------------------------------------------------
-- Switch between windows with Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Buffer navigation
map("n", "<S-L>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-H>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Close current buffer" })

-- Resize windows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window smaller" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window larger" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window narrower" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window wider" })

-- 🌑 Quality of Life
--------------------------------------------------------------------------------
-- Clear search highlighting
map("n", "<leader><space>", ":nohl<CR>", { desc = "Clear search highlight" })

-- Make 'Y' behave like 'D' and 'C' (yank to end of line)
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- Easier to leave terminal
map('t', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = true})

-- Copy to clipboard
map("v", "<leader>y", "\"+y", { desc = "Copy to Clipboard" })  -- Visual mode
map("n", "<leader>Y", "\"+Y", { desc = "Copy to Clipboard (Line)" })  -- Normal mode

-- Keep the cursor in place when joining lines
map("n", "J", "mzJ`z")

-- Center the screen on the cursor for next/previous search result
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- 🌑 Plugin-related keymaps will be defined within their respective plugin files
-- <leader>f -> Telescope (Find)
-- <leader>g -> Git related (Gitsigns, Lazygit)
-- <leader>l -> LSP
-- <leader>e -> Neo-tree (Explore)
--------------------------------------------------------------------------------
