-- Snacks.nvim: Explorer, lazygit, indent, notifier, and utilities
-- (picker disabled -- we use fzf-lua for fuzzy finding)
-- (explorer enabled -- replaces neo-tree)

---@module 'lazy'
---@type LazySpec
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      animate = { enabled = false },
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true, replace_netrw = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = {
        enabled = false,
        -- Explorer picker config (explorer is a picker in disguise).
        -- These settings apply to the explorer even with the general picker disabled.
        sources = {
          explorer = {
            hidden = true, -- show dotfiles
            ignored = false, -- respect gitignore
            layout = { preset = 'sidebar', preview = false },
            win = {
              list = {
                keys = {
                  -- Make <space> open which-key leader menu instead of default action
                  ['<space>'] = false,
                },
              },
            },
          },
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      scratch = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      lazygit = { enabled = true },
    },
    keys = {
      -- Explorer
      { '<leader>e', function() Snacks.explorer() end, desc = '[e]xplorer' },
      -- Lazygit
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'lazy[g]it' },
      -- Notifications
      { '<leader>sun', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
      { '<leader>suN', function() Snacks.notifier.hide() end, desc = 'Dismiss Notifications' },
      -- Buffer delete
      { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
      { '<leader>bD', function() Snacks.bufdelete.other() end, desc = 'Delete Other Buffers' },
    },
  },
}
