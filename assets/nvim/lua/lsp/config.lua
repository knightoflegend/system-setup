-- LSP Configuration for Neovim
return {
  "nvim-lspconfig" {
    enable = true,
    config = function()
      local lsp = require("lsp")
      
      -- Python
      lsp.setup("python", {
        name = "Python",
        connect = function()
          require("python.lsp_config").setup({
            interpreter = vim.fn.python_executable(),
            completions = true,
            hover = true,
            diagnostic_priority = 100,
          })
        end,
      })
      
      -- JavaScript/TypeScript
      lsp.setup("javascript", {
        name = "JavaScript",
        connect = function()
          require("typescript.lsp").setup({
            name = "TypeScript",
            interpreter = vim.fn.python_executable(),
            completions = true,
            hover = true,
            diagnostic_priority = 100,
          })
        end,
      })
      
      -- Rust
      lsp.setup("rust", {
        name = "Rust",
        connect = function()
          require("rust.lsp").setup({
            name = "Rust",
            interpreter = vim.fn.python_executable(),
            completions = true,
            hover = true,
            diagnostic_priority = 100,
          })
        end,
      })
      
      -- Go
      lsp.setup("go", {
        name = "Go",
        connect = function()
          require("go.lsp").setup({
            name = "Go",
            interpreter = vim.fn.go_executable(),
            completions = true,
            hover = true,
            diagnostic_priority = 100,
          })
        end,
      })
      
      -- Ruby
      lsp.setup("ruby", {
        name = "Ruby",
        connect = function()
          require("ruby.lsp").setup({
            name = "Ruby",
            interpreter = vim.fn.ruby_executable(),
            completions = true,
            hover = true,
            diagnostic_priority = 100,
          })
        end,
      })
      
      -- Java
      lsp.setup("java", {
        name = "Java",
        connect = function()
          require("java.lsp").setup({
            name = "Java",
            interpreter = vim.fn.java_executable(),
            completions = true,
            hover = true,
            diagnostic_priority = 100,
          })
        end,
      })
    end,
  },
}