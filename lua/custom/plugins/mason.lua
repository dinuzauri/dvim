-- Mason tools are configured separately from LSP plugins so cleanup always has the complete list.

---@module 'lazy'
---@type LazySpec
return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = require('custom.extras').mason_tools(),
        run_on_start = false,
      }
    end,
  },
}
