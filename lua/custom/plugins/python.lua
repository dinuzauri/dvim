-- Python: ty (type checker) + ruff (linter/formatter) via Mason

---@module 'lazy'
---@type LazySpec
return {
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      -- Ensure we have the servers table
      opts.servers = opts.servers or {}
    end,
    config = function()
      -- ty: Astral type checker for Python
      vim.lsp.config('ty', {
        init_options = {
          logLevel = 'error',
        },
        settings = {
          ty = {
            inlayHints = {
              variableTypes = false,
            },
            configuration = {
              rules = {
                ['invalid-argument-type'] = 'ignore',
                ['unresolved-reference'] = 'error',
                ['unresolved-attribute'] = 'ignore',
                ['possibly-missing-attribute'] = 'ignore',
                ['invalid-assignment'] = 'ignore',
                ['invalid-method-override'] = 'ignore',
              },
            },
          },
        },
      })
      vim.lsp.enable 'ty'

      -- ruff: Astral linter/formatter (linting only via LSP)
      vim.lsp.config('ruff', {
        init_options = {
          settings = { logLevel = 'error' },
        },
        on_attach = function(client, _)
          -- Disable non-linting capabilities (ruff is for linting only, formatting via conform)
          client.server_capabilities.hoverProvider = false
          client.server_capabilities.definitionProvider = false
          client.server_capabilities.completionProvider = false
          client.server_capabilities.referencesProvider = false
        end,
      })
      vim.lsp.enable 'ruff'
    end,
  },
  -- Ensure Mason installs the tools
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'ty',
        'ruff',
      })
    end,
  },
}
