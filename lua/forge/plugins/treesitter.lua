-- ~/.config/nvim/lua/forge/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  -- The build step is essential for Treesitter to work.
  -- It compiles the language parsers.
  build = ":TSUpdate",
  -- Load this plugin when a buffer is opened or created.
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- Provides additional textobjects, like 'function' or 'parameter'
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all"
      -- We'll provide a curated list of common languages for a fast setup.
      ensure_installed = {
        "bash", "c", "cpp", "css", "go", "html", "javascript",
        "json", "lua", "markdown", "markdown_inline", "python",
        "query", "rust", "typescript", "vim", "vimdoc", "yaml",
      },

      -- Install parsers synchronously (blocks UI on first run)
      sync_install = false,

      -- Automatically install missing parsers when entering a buffer
      auto_install = true,

      -- The core highlighting module
      highlight = {
        enable = true,
        -- Some languages have issues with Treesitter highlighting,
        -- you can disable them here if needed.
        -- disable = { "c", "rust" },
      },

      -- Better indentation based on the code's structure
      indent = { enable = true },

      -- Treesitter textobjects. This enables powerful motions and selections.
      -- For example: `vaf` (visual select around function), `dif` (delete in function)
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- V-i-f to select function contents
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
      },
    })
  end,
}