-- Django template support: LSP + formatter + filetype detection

---@module 'lazy'
---@type LazySpec
return {
  -- django_template_lsp for htmldjango files
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.config('django_template_lsp', {
        filetypes = { 'htmldjango' },
      })
      vim.lsp.enable 'django_template_lsp'
    end,
  },
  -- Ensure Mason installs django tools
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'django-template-lsp',
        'djlint',
      })
    end,
  },
}
