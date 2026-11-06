-- All plugin definitions for lazy.nvim
return {
  -- Plugin Manager
  { "folke/lazy.nvim", priority = 1000 },

  -- Syntax Highlighting (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end,
  },

  -- LSP Configuration
  { "neovim/nvim-lspconfig" },

  -- Completion (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })
    end,
  },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Telescope (Fuzzy Finder)
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" },
        },
      })
    end,
  },

  -- Git Integration
  { "lewis6991/gitsigns.nvim" },

  -- Commenting
  { "numToStr/Comment.nvim" },

  -- Auto Pairs
  { "windwp/nvim-autopairs" },

  -- Which-Key (Keybinding hints)
  { "folke/which-key.nvim" },

  -- Indent Blankline
  { "lukas-reineke/indent-blankline.nvim" },

  -- Status Line
  { "hoob3rt/lualine.nvim" },

  -- Bufferline
  { "akinsho/bufferline.nvim" },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle Explorer" },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Markdown Preview (mdickin)
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    cmd = "MarkdownPreview",
  },

  -- Lualine components for status line
  {
    "nvim-tree/nvim-web-devicons",
    enabled = true,
  },

  -- Auto Session
  {
    "Shatur/neovim-session-manager",
    config = function()
      require("session_manager").setup({
        sessions_directory = "~/.config/nvim/sessions",
      })
    end,
  },
}