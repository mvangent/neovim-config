# LSP Setup Documentation

## Overview

This configuration uses the modern Neovim 0.11+ `vim.lsp.config` API integrated with Mason for LSP server management.

## Architecture

### File Structure

```
lua/
├── plugins/
│   └── lsp.lua              # Main LSP setup with mason-lspconfig handlers
└── lsp/
    ├── servers.lua          # Server-specific configurations
    └── diagnostics.lua      # Diagnostic UI and auto-format settings
```

### How It Works

1. **Mason** (`lua/plugins/lsp.lua`) installs LSP servers
2. **mason-lspconfig** bridges Mason and Neovim's LSP
3. **Handlers** in `mason-lspconfig.setup()` configure each server using `vim.lsp.config`
4. **Server configs** from `lua/lsp/servers.lua` provide settings for each LSP
5. **Diagnostics** from `lua/lsp/diagnostics.lua` set up UI and formatting

## Key Components

### 1. Plugin Setup (`lua/plugins/lsp.lua`)

The main LSP configuration happens in the `mason-lspconfig.nvim` config function:

```lua
mason_lspconfig.setup({
  ensure_installed = { "ts_ls", "gopls", "jdtls", ... },
  automatic_installation = true,
  handlers = {
    function(server_name)
      -- Gets config from lua/lsp/servers.lua
      local server_config = servers[server_name] or {}

      -- Adds capabilities and keymaps
      local config = vim.tbl_deep_extend("force", server_config, {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Registers using modern API
      vim.lsp.config(server_name, config)

      -- Enables for appropriate filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = config.filetypes,
        callback = function()
          vim.lsp.enable(server_name)
        end,
      })
    end,
  },
})
```

### 2. Server Configurations (`lua/lsp/servers.lua`)

Each server has:
- `cmd`: Command to start the server
- `filetypes`: File types that trigger the LSP
- `root_markers`: Files that identify project root
- `settings`: Server-specific configuration

Example:
```lua
gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      gofumpt = true,
      hints = { ... },
    },
  },
},
```

### 3. LSP Keymaps

Defined in `on_attach` function in `lua/plugins/lsp.lua`:

- `gd` - Go to definition
- `gD` - Go to declaration
- `K` - Hover documentation
- `gi` - Go to implementation
- `gr` - Find references
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format document

### 4. Diagnostics (`lua/lsp/diagnostics.lua`)

- Diagnostic signs and UI configuration
- Auto-format on save for: `.go`, `.ts`, `.js`, `.tsx`, `.jsx`, `.java`

## Adding a New LSP Server

1. **Install via Mason**: Add to `ensure_installed` in `lua/plugins/lsp.lua`
2. **Configure**: Add entry to `lua/lsp/servers.lua`:

```lua
my_new_server = {
  cmd = { "my-language-server" },
  filetypes = { "myft" },
  root_markers = { ".git", "my-config.json" },
  settings = {
    -- Server-specific settings
  },
},
```

3. **Restart Neovim**: Mason will auto-install the server

## Modern API Benefits

### Before (Deprecated)
```lua
require('lspconfig').gopls.setup({ ... })
```

### After (Modern)
```lua
vim.lsp.config('gopls', { ... })
vim.lsp.enable('gopls')
```

### Why Better?
- Native Neovim API (no external dependency)
- Future-proof (won't be deprecated)
- Better performance
- Cleaner integration with Neovim 0.11+

## Troubleshooting

### LSP Not Starting
1. Check if server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Verify filetypes match in `servers.lua`
4. Check logs: `:lua vim.cmd('e ' .. vim.lsp.get_log_path())`

### Server Configuration Not Applied
1. Verify entry exists in `lua/lsp/servers.lua`
2. Check that server_name matches Mason's name
3. Restart Neovim to reload configuration

### Keymaps Not Working
1. Keymaps only work when LSP is attached
2. Check `:LspInfo` to see if server is running
3. Verify `on_attach` is being called

## Customization

### Change Keymaps
Edit the `on_attach` function in `lua/plugins/lsp.lua`

### Add Auto-Format for New Filetype
Edit the autocmd pattern in `lua/lsp/diagnostics.lua`:
```lua
pattern = { "*.go", "*.ts", "*.mynewtype" },
```

### Customize Diagnostic Display
Edit `vim.diagnostic.config()` in `lua/lsp/diagnostics.lua`

### Server-Specific Handler
Add named handler in `mason-lspconfig.setup()`:
```lua
handlers = {
  function(server_name) ... end,  -- default
  ["rust_analyzer"] = function()
    -- Custom setup for rust_analyzer
  end,
}
```

## Requirements

- Neovim 0.11.0 or later
- Mason (for server installation)
- mason-lspconfig (for integration)
- nvim-cmp (for completion capabilities)

## Resources

- [vim.lsp.config documentation](https://neovim.io/doc/user/lsp.html)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
