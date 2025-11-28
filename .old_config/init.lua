return {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    { "junegunn/fzf",                             run = "./install --all" },
    'junegunn/fzf.vim',
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-treesitter/nvim-treesitter',          run = ':TSUpdate' },
    'nvim-telescope/telescope.nvim',
    'ThePrimeagen/harpoon',
    'kyazdani42/nvim-web-devicons',
    'ayu-theme/ayu-vim',
    'tpope/vim-fugitive',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/vim-vsnip',
    'akinsho/toggleterm.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'mxsdev/nvim-dap-vscode-js',
    'zbirenbaum/copilot.lua',
    'CopilotC-Nvim/CopilotChat.nvim',
    'nvim-neotest/nvim-nio',
    'nvimtools/none-ls.nvim',
    {
        "mason-org/mason.nvim"
    },
    { "mason-org/mason-lspconfig.nvim", config = function() end },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
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
    },
}
