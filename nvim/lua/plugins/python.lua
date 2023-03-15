
require('lspconfig')['pyright'].setup{
    on_attach = require("plugins.lsp"),
    flags = {
      debounde_text_changes = 150
    },
}
