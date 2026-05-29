-- fzf-lua: Fuzzy finder with true fzf algorithm (replaces Telescope)

---@module 'lazy'
---@type LazySpec
return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    keys = {
      -- Top-level shortcuts
      { '<leader><leader>', function() require('fzf-lua').live_grep() end, desc = 'Grep (all files)' },
      { '<leader>/', function() require('fzf-lua').files() end, desc = 'Find files' },

      -- Find/file group (<leader>f)
      { '<leader>ff', function() require('fzf-lua').files() end, desc = 'Files' },
      { '<leader>fb', function() require('fzf-lua').buffers() end, desc = 'Buffers' },
      { '<leader>fg', function() require('fzf-lua').git_files() end, desc = 'Git files' },
      { '<leader>fo', function() require('fzf-lua').oldfiles() end, desc = 'Recent files' },
      { '<leader>fc', function() require('fzf-lua').files { cwd = vim.fn.stdpath 'config' } end, desc = 'Config files' },
      { '<leader>fd', function() require('fzf-lua').diagnostics_workspace() end, desc = 'Diagnostics' },
      { '<leader>fh', function() require('fzf-lua').helptags() end, desc = 'Help tags' },
      { '<leader>fk', function() require('fzf-lua').keymaps() end, desc = 'Keymaps' },
      { '<leader>fl', function() require('fzf-lua').blines() end, desc = 'Buffer lines' },
      { '<leader>fw', function() require('fzf-lua').grep_cword() end, desc = 'Grep word under cursor' },
      { '<leader>fw', function() require('fzf-lua').grep_visual() end, mode = 'v', desc = 'Grep visual selection' },
      { '<leader>fR', function() require('fzf-lua').resume() end, desc = 'Resume last picker' },
      { '<leader>f:', function() require('fzf-lua').command_history() end, desc = 'Command history' },

      -- LSP integration (under g prefix)
      { 'gd', function() require('fzf-lua').lsp_definitions() end, desc = 'Goto Definition' },
      { 'gr', function() require('fzf-lua').lsp_references() end, desc = 'Goto References' },
      { 'gI', function() require('fzf-lua').lsp_implementations() end, desc = 'Goto Implementation' },
      { 'gy', function() require('fzf-lua').lsp_typedefs() end, desc = 'Goto Type Definition' },
    },
    opts = {
      defaults = {
        formatter = 'path.filename_first',
      },
      fzf_opts = {
        ['--layout'] = 'reverse',
      },
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          layout = 'vertical',
          vertical = 'down:45%',
        },
      },
      files = {
        cwd_prompt = false,
      },
      grep = {
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
      },
    },
  },
}
