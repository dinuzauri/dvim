-- Django template support: LSP + formatter + filetype detection

---@module 'lazy'
---@type LazySpec
return {
  -- django_template_lsp for htmldjango files
  {
    'neovim/nvim-lspconfig',
    config = function()
      if not require('custom.extras').is_enabled 'django' then return end

      vim.lsp.config('django_template_lsp', {
        filetypes = { 'htmldjango' },
      })
      vim.lsp.enable 'django_template_lsp'
    end,
  },
}
