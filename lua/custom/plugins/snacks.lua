-- Snacks.nvim: Dashboard, lazygit, indent, notifier, and utilities
-- (picker disabled -- we use fzf-lua for fuzzy finding)
-- (explorer disabled -- we use neo-tree)

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
      dashboard = {
        enabled = true,
        preset = {
          header = table.concat({
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
          }, "\n"),
        },
      },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = false },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      scratch = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      lazygit = { enabled = true },
    },
    keys = {
      -- Lazygit
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
      -- Notifications
      { '<leader>sun', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
      { '<leader>suN', function() Snacks.notifier.hide() end, desc = 'Dismiss Notifications' },
      -- Buffer delete
      { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
      { '<leader>bD', function() Snacks.bufdelete.other() end, desc = 'Delete Other Buffers' },
    },
  },
}
