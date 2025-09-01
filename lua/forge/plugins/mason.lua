-- ~/.config/nvim/lua/forge/plugins/mason.lua
return {
  "williamboman/mason.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    -- Enable Mason
    mason.setup()

    -- This is our global `on_attach` function, which I'll use for all servers
    local on_attach = function(client, bufnr)
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
      map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
      map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
      map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      map("K", vim.lsp.buf.hover, "Hover Documentation")

      if client.supports_method("textDocument/formatting") then
        local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    -- Define the list of servers we want to ensure are installed
    local servers = {
      "lua_ls",
      "pyright",
    }


    -- I set up mason-lspconfig with a single call, passing both
    -- the list of servers to install and the handlers to use.
    mason_lspconfig.setup({
      ensure_installed = servers,
      handlers = {
        -- The default handler. This is called for each server that doesn't have a
        -- specific handler defined below.
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach, -- Use our global on_attach function
          })
        end,

        -- You can also override the setup for specific servers here.
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  -- Get the language server to recognize "vim" as a global
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    })
  end,
}