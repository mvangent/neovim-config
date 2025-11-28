-- Editor Enhancement Plugins
-- Plugins that enhance the editing experience: fuzzy finding, syntax highlighting, etc.

return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          layout_config = {
            horizontal = { preview_width = 0.6 },
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "typescript",
          "javascript",
          "tsx",
          "go",
          "java",
          "sql",
          "hcl",        -- Terraform
          "dockerfile",
          "json",
          "yaml",
          "markdown",
          "bash",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },

  -- Harpoon for quick file navigation
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>h", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon Add" },
      { "<leader>l", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Menu" },
    },
  },

  -- FZF integration
  {
    "junegunn/fzf",
    build = "./install --all",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },

  -- Toggle terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        size = 35,
        -- open_mapping removed - using normal mode only keybinding in keymaps.lua
        direction = "horizontal",
        shade_terminals = true,
      })
    end,
  },
}
