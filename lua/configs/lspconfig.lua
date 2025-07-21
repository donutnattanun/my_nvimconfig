require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","rust-analyzer","lua-ls"  }
vim.lsp.enable(servers)
-- lua/configs/lspconfig.lua
local on_attach = function(client, bufnr)
  -- Format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end

  -- Enable inlay hints
  if client.name == "rust_analyzer" then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

-- Setup rust-analyzer
require("lspconfig").rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        buildScripts = { enable = true },
      },
      checkOnSave = {
        command = "clippy"
      },
      procMacro = {
        enable = true
      },
    }
  }
})
-- read :h vim.lsp.config for changing options of lsp servers 
