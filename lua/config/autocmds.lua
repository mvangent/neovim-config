-- Autocommands
-- All autocommands are defined here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Format Go files on save
local go_group = augroup("GoFormat", { clear = true })
autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format()
    end,
    group = go_group,
    desc = "Format Go files on save"
})

-- Highlight on yank
local yank_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 150 })
    end,
    group = yank_group,
    desc = "Highlight on yank"
})

-- Remove trailing whitespace on save
local whitespace_group = augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
    group = whitespace_group,
    desc = "Remove trailing whitespace"
})
