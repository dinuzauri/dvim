-- Lualine: Status line (replaces mini.statusline)

---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        globalstatus = true,
        theme = 'auto',
      },
    },
  },
}
