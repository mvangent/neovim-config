# Upgrade Notes - Modern LSP API

## What Changed

Your Neovim configuration has been updated to use the modern `vim.lsp.config` API introduced in Neovim 0.11.

### Before (Deprecated)
```lua
local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup({ ... })
```

### After (Modern)
```lua
vim.lsp.config("ts_ls", { ... })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "javascript" },
  callback = function()
    vim.lsp.enable("ts_ls")
  end,
})
```

## Why This Change?

1. **Deprecation Notice**: The old `require('lspconfig')` framework will be removed in nvim-lspconfig v3.0.0
2. **Native Support**: Neovim 0.11+ has built-in LSP configuration support
3. **Better Performance**: Native APIs are faster and better integrated
4. **Future-Proof**: Your configuration will continue working with future Neovim versions

## Requirements

- **Neovim 0.11.0 or later** is required for this configuration
- Check your version: `nvim --version`
- Update if needed: `brew upgrade neovim` (macOS)

## What Still Works

Everything! All your keybindings, features, and functionality remain exactly the same:
- ✅ All LSP servers still work
- ✅ Mason still manages installations
- ✅ All keybindings unchanged
- ✅ Auto-format on save still works
- ✅ Inlay hints still work
- ✅ Code completion still works

## Technical Details

### File Changes
- `lua/lsp/init.lua` - Updated to use `vim.lsp.config()` and `vim.lsp.enable()`
- `lua/lsp/servers.lua` - Added explicit `cmd`, `filetypes`, and `root_markers` to each server
- `lua/plugins/lsp.lua` - Updated comments to clarify modern API usage

### How It Works Now

1. **Mason** installs LSP servers (unchanged)
2. **mason-lspconfig** triggers setup handlers (unchanged)
3. **Our code** uses `vim.lsp.config()` to register servers (NEW)
4. **Autocommands** enable LSP when opening appropriate files (NEW)

### Backward Compatibility

- nvim-lspconfig plugin is still installed (required by mason-lspconfig)
- We just don't use the deprecated `require('lspconfig')` API
- No breaking changes to functionality

## Verification

After updating, test that LSP works:

1. Open a TypeScript file: `nvim test.ts`
2. Check LSP status: `:LspInfo`
3. Test features:
   - `gd` - Go to definition
   - `K` - Hover documentation
   - `<leader>ca` - Code actions

If everything works, you're all set! No more deprecation warnings.

## Rollback (if needed)

If you encounter issues and need the old approach:

```bash
cd ~/.config/nvim
git log --oneline  # Find commit before LSP update
git checkout <commit-hash> lua/lsp/
```

But the new approach should work seamlessly!
