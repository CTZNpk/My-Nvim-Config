local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "Haider.lsp.mason"
require("Haider.lsp.handlers").setup()
require "Haider.lsp.null-ls"
