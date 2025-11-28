-- LSP Configuration Plugins
-- Mason for LSP server management
-- nvim-lspconfig kept as dependency for mason-lspconfig compatibility
-- but we use the modern vim.lsp.config API (Neovim 0.11+) in our configuration

return {
  -- Mason - LSP installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  -- Mason-LSPConfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Enhanced capabilities from nvim-cmp
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Common LSP keymaps
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- Key mappings
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("v", "ga", vim.lsp.buf.code_action, opts)  -- Visual mode uses non-leader
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- Enable inlay hints if supported
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end

      -- Load server configurations
      local servers = require("lsp.servers")

      mason_lspconfig.setup({
        -- Automatically install these LSP servers
        ensure_installed = {
          "ts_ls",           -- TypeScript/JavaScript
          "jdtls",           -- Java
          "gopls",           -- Go
          "terraformls",     -- Terraform
          "dockerls",        -- Dockerfile
          "docker_compose_language_service", -- Docker Compose
          "sqlls",           -- SQL
          "lua_ls",          -- Lua (for Neovim config)
          "jsonls",          -- JSON
          "yamlls",          -- YAML
        },
        automatic_installation = true,
        -- Setup handlers for each server
        handlers = {
          -- Default handler - called for each installed server
          function(server_name)
            local server_config = servers[server_name] or {}

            -- Merge with capabilities and on_attach
            local config = vim.tbl_deep_extend("force", server_config, {
              capabilities = capabilities,
              on_attach = on_attach,
            })

            -- Register the LSP server configuration using modern API
            vim.lsp.config(server_name, config)

            -- Enable the server for appropriate filetypes
            if config.filetypes then
              vim.api.nvim_create_autocmd("FileType", {
                pattern = config.filetypes,
                callback = function()
                  vim.lsp.enable(server_name)
                end,
              })
            end
          end,
        },
      })

      -- Load additional LSP configuration (diagnostics, etc.)
      require("lsp.diagnostics")
    end,
  },

  -- LSP Configuration
  -- Note: nvim-lspconfig is kept as a dependency for mason-lspconfig
  -- but our actual LSP setup uses vim.lsp.config (see lua/lsp/init.lua)
  -- LSP configuration is triggered by mason-lspconfig after setup
  {
    "neovim/nvim-lspconfig",
    lazy = true,
  },

  -- JSON/YAML schemas
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
