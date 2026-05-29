-- Kulala: REST client under <leader>tr (tools -> REST)

---@module 'lazy'
---@type LazySpec
return {
  {
    'mistweaverco/kulala.nvim',
    ft = 'http',
    opts = {
      display_mode = 'float',
      winbar = true,
      default_env = 'dev',
      request_timeout = 30000,
    },
    keys = {
      { '<leader>trs', function() require('kulala').run() end, desc = 'Send request', ft = 'http' },
      { '<leader>tra', function() require('kulala').run_all() end, desc = 'Send all requests', ft = 'http' },
      { '<leader>tri', function() require('kulala').toggle_view() end, desc = 'Inspect/toggle body', ft = 'http' },
      { '<leader>trv', function() require('kulala').set_selected_env() end, desc = 'Select environment', ft = 'http' },
      { '<leader>trc', function() require('kulala').copy() end, desc = 'Copy as curl', ft = 'http' },
      { '<leader>trp', function() require('kulala').from_curl() end, desc = 'Paste from curl', ft = 'http' },
    },
  },
}
