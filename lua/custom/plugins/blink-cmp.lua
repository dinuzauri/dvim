-- Blink-cmp: Completion keymap tweaks + friendly-snippets

---@module 'lazy'
---@type LazySpec
return {
  -- Enable friendly-snippets for HTML/JS/Python snippet support
  {
    'saghen/blink.cmp',
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
      },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'fallback' },
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-y>'] = { 'select_and_accept' },
      },
    },
  },
}
