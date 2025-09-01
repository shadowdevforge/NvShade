-- ~/.config/nvim/lua/forge/core/autocmds.lua
--
-- Automation scripts that trigger on specific events in Neovim.
-- I used a single augroup to keep things organized and easy to debug.

-- Create a dedicated augroup for NvShade
local nvshade_augroup = vim.api.nvim_create_augroup("NvShadeAugroup", { clear = true })

-- Helper function to create autocommands
local function autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, vim.tbl_extend("force", {
    group = nvshade_augroup,
  }, opts))
end

-- 🌑 Quality of Life Autocmds
--------------------------------------------------------------------------------
-- 1. Highlight the region on yank
-- Provides immediate visual feedback for what was just copied.
autocmd("TextYankPost", {
  desc = "Highlight selection on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- 2. Restore cursor position
-- When you open a file, jump to the last known cursor position.
autocmd("BufReadPost", {
  desc = "Restore cursor position on opening a file",
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

-- 3. Equalize window splits when the terminal is resized
autocmd("VimResized", {
  desc = "Equalize window splits on resize",
  pattern = "*",
  command = "wincmd =",
})

-- 4. Check for file changes when buffer is focused
-- Automatically reloads file if changed outside of Neovim
autocmd({ "FocusGained", "BufEnter" }, {
  desc = "Check for external file changes",
  pattern = "*",
  command = "checktime",
})

-- 5. Close certain filetypes with 'q'
autocmd("FileType", {
  desc = "Close certain filetypes with 'q'",
  pattern = {
    "help",
    "man",
    "qf",
    "lspinfo",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})
--------------------------------------------------------------------------------------
