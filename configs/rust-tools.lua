local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


local options = {
  server = {
settings = {
            ["rust-analyzer"] = {
              cargo = {
                features = "all",
              },
              -- Add clippy lints for Rust.
              checkOnSave = true,
              check = {
                command = "clippy",
                features = "all",
              },
              procMacro = {
                enable = true,
              },
            },
          },
    on_attach = on_attach,
    capabilities = capabilities,
  }
}

return options
