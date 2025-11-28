-- Key Mappings
-- All keybindings are defined here for easy reference
-- Note: Leader keys are set in init.lua before loading plugins

local keymap = vim.keymap.set

-- File Explorer
keymap("n", "<leader>pv", ":Vex <bar> :vertical resize 120<CR>", { desc = "Open vertical explorer" })
keymap("n", "<leader>pf", ":Ex<CR>", { desc = "Open file explorer" })

-- Source config
keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>", { desc = "Source config" })

-- Telescope
keymap("n", "<C-p>", ":GFiles<CR>", { desc = "Find git files" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- Clipboard
keymap("v", "<leader>p", '"_dP', { desc = "Paste without yanking" })
keymap("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>Y", 'gg"+yG', { desc = "Yank all to clipboard" })
keymap("n", "<leader>fp", ':let @" = expand("%")<cr>', { desc = "Copy file path" })

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Window navigation
keymap("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
keymap("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
keymap("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
keymap("n", "<leader>wl", "<C-w>l", { desc = "Window right" })

-- Quickfix navigation
keymap("n", "<C-j>", ":cnext<CR>", { desc = "Next quickfix" })
keymap("n", "<C-k>", ":cprev<CR>", { desc = "Previous quickfix" })

-- Git
keymap("n", "<leader>g", ":Git ", { desc = "Git command" })
keymap("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Git write" })

-- Terminal
keymap("n", "<leader>t", "<cmd>ToggleTerm size=35<cr>", { desc = "Toggle terminal" })

-- LSP
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format file" })

-- Harpoon
keymap("n", "<leader>h", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon add file" })
keymap("n", "<leader>l", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Harpoon menu" })

-- DAP (Debugger)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Debug continue" })
keymap("n", "<leader>dso", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
keymap("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
keymap("n", "<leader>do", "<cmd>lua require'dap'.repl.open()<cr>", { desc = "Open REPL" })
keymap("n", "<leader>dh", ":help dap-widgets<cr>", { desc = "DAP help" })

-- Copilot Chat
keymap("n", "<leader>P", "<cmd>lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').help_actions())<CR>", { desc = "Copilot help actions" })
keymap("n", "<leader>p", "<cmd>lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions())<CR>", { desc = "Copilot prompt actions" })
