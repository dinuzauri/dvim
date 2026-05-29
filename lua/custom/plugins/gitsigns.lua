-- Gitsigns: override keymaps to use <leader>gh (git > hunks) prefix
-- instead of kickstart's <leader>h

---@module 'lazy'
---@type LazySpec
return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next git change' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Prev git change' })

        -- Actions (under <leader>gh = git hunks)
        map('v', '<leader>ghs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[s]tage hunk' })
        map('v', '<leader>ghr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[r]eset hunk' })

        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
        map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
        map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
        map('n', '<leader>ghi', gitsigns.preview_hunk_inline, { desc = 'preview hunk [i]nline' })
        map('n', '<leader>ghb', function() gitsigns.blame_line { full = true } end, { desc = '[b]lame line' })
        map('n', '<leader>ghd', gitsigns.diffthis, { desc = '[d]iff against index' })
        map('n', '<leader>ghD', function() gitsigns.diffthis '@' end, { desc = '[D]iff against last commit' })
        map('n', '<leader>ghQ', function() gitsigns.setqflist 'all' end, { desc = '[Q]uickfix list (all files)' })
        map('n', '<leader>ghq', gitsigns.setqflist, { desc = '[q]uickfix list (this file)' })

        -- Toggles (under <leader>st = settings > toggles)
        map('n', '<leader>stb', gitsigns.toggle_current_line_blame, { desc = 'toggle git [b]lame line' })
        map('n', '<leader>stw', gitsigns.toggle_word_diff, { desc = 'toggle git [w]ord diff' })

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
      end,
      -- something might be veryy wrong here because shit is telling the wrong stuff
    },
  },
}
