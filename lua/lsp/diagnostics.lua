-- LSP Diagnostics and UI Configuration
-- Separated from main LSP setup for clarity

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Auto-format on save for specific filetypes
local format_on_save_group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go", "*.ts", "*.js", "*.tsx", "*.jsx", "*.java" },
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 2000 })
  end,
  group = format_on_save_group,
})
