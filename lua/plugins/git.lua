-- Git Integration Plugins
-- Plugins for Git integration and version control

return {
  -- Fugitive - Git wrapper
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwrite", "Gread", "Gdiffsplit" },
    keys = {
      { "<leader>g", ":Git ", desc = "Git command" },
      { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Git write" },
    },
  },
}
