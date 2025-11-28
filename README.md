# Neovim Configuration

A clean, well-organized Neovim configuration with LSP support for multiple languages.

## Features

- **Package Management**: Lazy.nvim for fast plugin management
- **Modern LSP Setup**: Uses Neovim 0.11+ built-in `vim.lsp.config` API
- **LSP Support**: Full LSP setup via Mason for:
  - TypeScript/JavaScript
  - Java (Spring Boot)
  - Go
  - SQL
  - Terraform
  - Docker & Docker Compose
  - Lua, JSON, YAML
- **Code Completion**: nvim-cmp with LSP integration
- **AI Assistance**: GitHub Copilot integration
- **Debugging**: DAP support for multiple languages
- **Git Integration**: Fugitive for Git commands
- **Fuzzy Finding**: Telescope for file/text search
- **Syntax Highlighting**: Treesitter for better syntax highlighting

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua        # Vim options
│   │   ├── keymaps.lua        # Key mappings
│   │   ├── autocmds.lua       # Autocommands
│   │   └── lazy.lua           # Lazy.nvim setup
│   ├── plugins/
│   │   ├── editor.lua         # Telescope, Treesitter, Harpoon, etc.
│   │   ├── ui.lua             # Theme, icons, Trouble
│   │   ├── git.lua            # Git integration
│   │   ├── coding.lua         # Copilot, completion, snippets
│   │   ├── lsp.lua            # Mason, LSPConfig, and LSP setup
│   │   └── debugging.lua      # DAP configuration
│   └── lsp/
│       ├── servers.lua        # Individual LSP server configs
│       └── diagnostics.lua    # Diagnostic configuration
└── README.md                   # This file
```

## Installation

1. **Backup your existing config** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Install Neovim** (0.9.0 or later required):
   ```bash
   brew install neovim  # macOS
   ```

3. **Clone or use this configuration**

4. **Start Neovim**:
   ```bash
   nvim
   ```

5. **Wait for Lazy to install plugins**:
   - Lazy.nvim will automatically bootstrap and install all plugins
   - Mason will automatically install LSP servers

6. **Verify LSP servers** (optional):
   ```vim
   :Mason
   ```

## Key Mappings

Leader key is `<Space>`

### General
- `<leader><CR>` - Source config file
- `<leader>fp` - Copy current file path to clipboard

### File Navigation
- `<C-p>` - Find Git files (FZF)
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Find buffers (Telescope)
- `<leader>fh` - Help tags (Telescope)
- `<leader>pv` - Open vertical explorer
- `<leader>pf` - Open file explorer

### Harpoon (Quick Navigation)
- `<leader>h` - Add file to Harpoon
- `<leader>l` - Toggle Harpoon menu

### Window Navigation
- `<leader>wk` - Move to window above
- `<leader>wj` - Move to window below
- `<leader>wh` - Move to window left
- `<leader>wl` - Move to window right

### Editing
- `<leader>y` - Yank to system clipboard
- `<leader>Y` - Yank entire file to clipboard
- `<leader>p` - Paste without yanking (visual mode)
- `J` - Move line down (visual mode)
- `K` - Move line up (visual mode)

### LSP
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Go to references
- `K` - Hover documentation
- `<C-k>` - Signature help
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>f` - Format file
- `<leader>D` - Type definition

### Git
- `<leader>g` - Git command
- `<leader>gw` - Git write (stage current file)

### Terminal
- `<leader>t` - Toggle terminal

### Debugging (DAP)
- `<leader>dt` - Toggle breakpoint
- `<leader>dc` - Continue debugging
- `<leader>dso` - Step over
- `<leader>dsi` - Step into
- `<leader>do` - Open REPL
- `<leader>dh` - DAP help

### Copilot
- `<C-l>` - Accept Copilot suggestion (insert mode)
- `<M-]>` - Next suggestion
- `<M-[>` - Previous suggestion
- `<C-]>` - Dismiss suggestion
- `<leader>P` - Copilot help actions
- `<leader>p` - Copilot prompt actions

### Trouble (Diagnostics)
- `<leader>xx` - Toggle diagnostics
- `<leader>xX` - Buffer diagnostics
- `<leader>cs` - Symbols
- `<leader>cl` - LSP definitions/references

### Quickfix
- `<C-j>` - Next item
- `<C-k>` - Previous item

## Language-Specific Setup

### TypeScript/JavaScript
- LSP: `ts_ls` (automatically installed)
- Features: Inlay hints, auto-format on save
- Debugging: Node.js debugger configured

### Java (Spring Boot)
- LSP: `jdtls` (automatically installed)
- Features: Auto-imports, code generation, auto-format on save
- Note: You may need to configure Java runtimes in `lua/lsp/servers.lua`

### Go
- LSP: `gopls` (automatically installed)
- Features: Auto-format with gofumpt on save, inlay hints
- Formatting: Automatic on save

### SQL
- LSP: `sqlls` (automatically installed)
- Features: Basic SQL completion and diagnostics

### Terraform
- LSP: `terraformls` (automatically installed)
- Features: HCL syntax support, validation

### Docker
- LSP: `dockerls` and `docker_compose_language_service` (automatically installed)
- Features: Dockerfile and docker-compose.yml support

## Customization

### Adding New LSP Servers

1. Add the server to `lua/plugins/lsp.lua` in the `ensure_installed` list
2. Add server configuration (with cmd, filetypes, root_markers, settings) in `lua/lsp/servers.lua`
3. Restart Neovim and Mason will auto-install it

The LSP setup uses the modern `vim.lsp.config` API with handlers passed directly to `mason-lspconfig.setup()`.

### Adding New Plugins

1. Create or edit the appropriate file in `lua/plugins/`
2. Add plugin spec in Lazy.nvim format
3. Restart Neovim or run `:Lazy sync`

### Modifying Keymaps

Edit `lua/config/keymaps.lua` to change or add key mappings.

### Changing Options

Edit `lua/config/options.lua` to modify Vim settings.

## Modern LSP Configuration

This configuration uses Neovim 0.11+'s built-in `vim.lsp.config` API instead of the deprecated lspconfig framework. This provides:
- Native LSP configuration without external dependencies
- Better performance and integration with Neovim
- Future-proof setup that works with the latest Neovim features

The LSP servers are still managed by Mason for easy installation, but configuration uses the modern Neovim API.

## Troubleshooting

### LSP Not Working
1. Check if server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check logs: `:lua vim.cmd('e ' .. vim.lsp.get_log_path())`
4. **Note**: Requires Neovim 0.11 or later for modern LSP API

### Plugins Not Loading
1. Check Lazy status: `:Lazy`
2. Update plugins: `:Lazy sync`
3. Check for errors: `:messages`

### Copilot Not Working
1. Authenticate: `:Copilot auth`
2. Check status: `:Copilot status`

## Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## Auto-Format on Save

The following file types are automatically formatted on save:
- Go (`.go`)
- TypeScript/JavaScript (`.ts`, `.js`, `.tsx`, `.jsx`)
- Java (`.java`)

To disable or modify this, edit the autocommand in `lua/lsp/init.lua`.
