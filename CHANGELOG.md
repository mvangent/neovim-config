# Changelog

## 2025-11-28 - Modern LSP API Migration

### Changed
- **Migrated to `vim.lsp.config` API**: Updated LSP configuration to use Neovim 0.11+'s built-in `vim.lsp.config` instead of the deprecated `require('lspconfig')` framework
- **Future-proof setup**: Configuration now uses native Neovim LSP APIs that won't be deprecated in nvim-lspconfig v3.0.0
- **Improved LSP server definitions**: Each server now includes explicit `cmd`, `filetypes`, and `root_markers` for better clarity

### Technical Details
- Removed direct dependency on `require('lspconfig')`
- LSP servers now registered via `vim.lsp.config()` function
- Mason-lspconfig handlers updated to use modern API
- Each server configuration includes:
  - `cmd`: Command to start the LSP server
  - `filetypes`: File types that trigger the LSP
  - `root_markers`: Files that identify project root
  - `settings`: Server-specific configuration

### Benefits
- No more deprecation warnings
- Better performance with native Neovim APIs
- Cleaner separation between Mason (installation) and Neovim (configuration)
- Future-proof as nvim-lspconfig moves toward v3.0.0

### Requirements
- Neovim 0.11.0 or later
- All previous functionality maintained
- No user-facing changes to keybindings or features

---

## 2025-11-28 - Initial Reorganization

### Added
- Complete modular configuration structure
- Separate files for options, keymaps, autocmds
- Plugin categorization (editor, ui, git, coding, lsp, debugging)
- Comprehensive README documentation
- Migration guide from old configuration
- Full LSP support for TypeScript, Java, Go, SQL, Terraform, Docker
- Auto-format on save for multiple languages
- Inlay hints support
- Schema validation for JSON/YAML

### Changed
- Migrated from VimScript (`init.vim`) to Lua (`init.lua`)
- Reorganized plugins into logical categories
- Centralized all keybindings in one file
- Improved Copilot configuration
- Enhanced LSP setup with better defaults

### Removed
- Old monolithic configuration files (backed up to `.old_config/`)
- Redundant configuration code
