-- Neo-tree: File explorer sidebar (replaces Snacks explorer)
-- Buffer filetype is 'neo-tree' which is nomodifiable -- won't trigger TextChanged

---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle Explorer' },
      { '<leader>E', '<cmd>Neotree reveal<cr>', desc = 'Reveal file in Explorer' },
    },
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            '.git',
            'node_modules',
            '__pycache__',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
        },
      },
      window = {
        position = 'left',
        width = 35,
        mappings = {
          ['<space>'] = { 'toggle_node', nowait = false },
          ['<cr>'] = 'open',
          ['<esc>'] = 'cancel',
          ['P'] = { 'toggle_preview', config = { use_float = true } },
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
          ['t'] = 'open_tabnew',
          ['C'] = 'close_node',
          ['z'] = 'close_all_nodes',
          ['a'] = { 'add', config = { show_path = 'relative' } },
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy',
          ['m'] = 'move',
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = '',
            modified = '',
            deleted = '',
            renamed = '',
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
      },
    },
  },
}
