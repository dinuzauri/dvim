-- JavaScript/TypeScript: vtsls language server + treesitter parsers

---@module 'lazy'
---@type LazySpec
return {
  -- vtsls: TypeScript/JavaScript language server (used by LazyVim)
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.config('vtsls', {
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = 'literals' },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = 'literals' },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      })
      vim.lsp.enable 'vtsls'
    end,
  },
  -- Ensure Mason installs the tools
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'vtsls',
        'prettierd',
        'prettier',
      })
    end,
  },
  -- Additional treesitter parsers for web development
  -- NOTE: on main branch, parsers auto-install on FileType via the base config.
  -- Explicit eager install happens in kickstart/plugins/treesitter.lua.
}
