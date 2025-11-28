-- UI Plugins
-- Plugins for visual enhancements: themes, icons, statusline, etc.

return {
  -- Color scheme
  {
    "ayu-theme/ayu-vim",
    priority = 1000,
    config = function()
      vim.g.ayucolor = "dark"
      vim.cmd([[colorscheme ayu]])
    end,
  },

  -- Dev icons
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },

  -- Trouble for better diagnostics display
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-web-devicons" },
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {},
  },
}
