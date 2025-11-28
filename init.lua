-- Main entry point for Neovim configuration
-- This file loads all configuration modules in the correct order

-- Set leader keys BEFORE loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load core configuration
require("config.options")  -- Vim options (must be first)
require("config.lazy")     -- Plugin manager setup
require("config.keymaps")  -- Key mappings
require("config.autocmds") -- Autocommands

-- LSP configuration is loaded via plugin config (see lua/plugins/lsp.lua)
