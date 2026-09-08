-- Personal overrides for todo-comments.nvim.
-- Base spec lives in lua/kickstart/plugins/todo-comments.lua (upstream/kickstart).
-- lazy.nvim deep-merges these opts into the base one, so upstream stays untouched.
--
-- Add your own highlighted comment tags here. Each keyword points at a color
-- (either a built-in name or one defined in `colors` below), and `alt` lists
-- extra spellings that map to the same highlight. Usage in code:
--   # QUESTION: why is this here?
--   # IDEA: we could cache this
---@module 'lazy'
---@type LazySpec
return {
  {
    'folke/todo-comments.nvim',
    ---@module 'todo-comments'
    ---@type TodoOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      keywords = {
        AIQ = { icon = ' ', color = 'question', alt = {} },
        AIC = { icon = ' ', color = 'review', alt = {} },
        AIDO = { icon = ' ', color = 'aido', alt = {} },
        AIR = { icon = ' ', color = 'reply', alt = {} },
      },
      colors = {
        question = { '#f97316' }, -- orange
        review = { '#d946ef' }, -- fuchsia
        aido = { '#10b981' }, -- green
        reply = { '#ff5faf' }, -- pink
      },
    },
  },
}
