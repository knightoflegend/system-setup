-- Neovim configuration
vim.g.mapleader = " "

-- Load plugins
require("config.lazy")

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")