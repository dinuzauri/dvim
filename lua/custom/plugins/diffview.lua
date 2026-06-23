-- Diffview: side-by-side diffs, file history, and 3-way merge conflict resolution.
-- Conflict UI: when in a merge/rebase, `:DiffviewOpen` shows OURS/THEIRS/BASE.
--   In a conflicted hunk use these (default diffview mappings):
--     <leader>co  choose OURS      <leader>ct  choose THEIRS
--     <leader>cb  choose BASE      <leader>ca  choose ALL
--     dx          delete conflict region
--     ]x / [x     next / prev conflict
-- Keymaps below live under <leader>gd (git > diff).

---@module 'lazy'
---@type LazySpec
return {
  {
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewFileHistory',
    },
    opts = {},
    keys = {
      { '<leader>gdo', '<cmd>DiffviewOpen<cr>', desc = '[o]pen diffview' },
      { '<leader>gdc', '<cmd>DiffviewClose<cr>', desc = '[c]lose diffview' },
      { '<leader>gdh', '<cmd>DiffviewFileHistory<cr>', desc = 'repo [h]istory' },
      { '<leader>gdf', '<cmd>DiffviewFileHistory %<cr>', desc = '[f]ile history' },
      { '<leader>gdf', '<esc><cmd>DiffviewFileHistory<cr>', mode = 'v', desc = '[f]ile history (range)' },
    },
  },
}
