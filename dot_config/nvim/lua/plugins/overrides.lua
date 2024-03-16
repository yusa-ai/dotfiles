return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          prepend_args = { "--single-quote" },
        },
        black = {
          prepend_args = { "--line-length", "79" },
        },
      },
    },
  },
}
