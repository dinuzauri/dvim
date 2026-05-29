-- Which-key: Helix preset with custom groups and keymaps
-- Overrides kickstart's default which-key config

---@module 'lazy'
---@type LazySpec
return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts_extend = { 'spec' },
    ---@module 'which-key'
    ---@type wk.Opts
    opts = {
      preset = 'helix',
      delay = 0,
      spec = {
        {
          mode = { 'n', 'x' },
          -- Find/file (unified search group)
          { '<leader>f', group = 'find/file', icon = { icon = '󰱼' } },
          { '<leader>/', group = 'find file', icon = { icon = '󰈞' } },
          { '<leader><leader>', group = 'fuzzy search', icon = { icon = '' } },

          -- Code
          { '<leader>c', group = 'code', icon = { icon = '󱃖' } },
          -- Git
          { '<leader>g', group = 'git', icon = { icon = '' } },
          { '<leader>gh', group = 'hunks' },
          { '<leader>gg', group = 'lazy git', icon = { icon = '' } },
          -- Tools
          { '<leader>t', group = 'tools', icon = { icon = '' } },
          { '<leader>tr', group = 'REST', icon = { icon = '' } },
          -- Settings
          { '<leader>s', group = 'settings', icon = { icon = '' } },
          { '<leader>su', group = 'ui', icon = { icon = '󰕮' } },
          { '<leader>st', group = 'toggles', icon = { icon = '󰔡' } },
          -- Buffer
          {
            '<leader>b',
            group = 'buffer',
            icon = { icon = '' },
            expand = function() return require('which-key.extras').expand.buf() end,
          },
          -- Windows
          {
            '<leader>w',
            group = 'windows',
            icon = { icon = '' },
            proxy = '<c-w>',
            expand = function() return require('which-key.extras').expand.win() end,
          },
          -- Quit
          { '<leader>q', group = 'quit', icon = { icon = '󰩈', color = 'red' } },
          -- Diagnostics/quickfix
          { '<leader>x', group = 'diagnostics/quickfix' },
          -- Explorer
          { '<leader>e', group = 'explorer', icon = { icon = '' } },
          -- Navigation groups
          { '[', group = 'prev' },
          { ']', group = 'next' },
          { 'g', group = 'goto' },
          { 'z', group = 'fold' },
          -- Splits (icons defined here in spec)
          { '<leader>|', icon = { icon = '' } },
          { '<leader>_', icon = { icon = '' } },
          -- Hide stale kickstart base groups (overridden by our layout)
          { '<leader>h', hidden = true },
        },
      },
    },
    keys = {
      -- Buffer local keymaps
      {
        '<leader>?',
        function() require('which-key').show { global = false } end,
        desc = 'Buffer Local Keymaps',
      },
      -- Window hydra mode
      {
        '<c-w><space>',
        function() require('which-key').show { keys = '<c-w>', loop = true } end,
        desc = 'Window Hydra Mode',
      },
      -- Quit all
      { '<leader>qq', '<cmd>qa<cr>', desc = 'Quit all' },
      -- Splits (no icon here -- icon is a which-key spec field, not valid in lazy keys)
      { '<leader>|', '<C-W>v', desc = 'Split right' },
      { '<leader>_', '<C-W>s', desc = 'Split below' },
    },
  },
}
