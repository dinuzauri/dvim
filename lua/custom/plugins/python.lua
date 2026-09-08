-- Python: ty (type checker) + ruff (linter/formatter) via Mason

---@module 'lazy'
---@type LazySpec
return {
  {
    'neovim/nvim-lspconfig',
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

      -- ruff: Astral linter/formatter; formatting runs through Conform.
      vim.lsp.config('ruff', {
        init_options = {
          settings = { logLevel = 'error' },
        },
        on_attach = function(client, _)
          -- Keep ty as the source of Python navigation and completion.
          -- Conform invokes Ruff's CLI formatter rather than this LSP capability.
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
