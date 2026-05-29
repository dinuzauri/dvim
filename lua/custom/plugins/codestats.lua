-- Code::Stats - Programming stats tracking

---@module 'lazy'
---@type LazySpec
return {
  {
    'dinuzauri/codestats.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'TextChanged', 'InsertEnter' },
    cmd = { 'CodeStatsXpSend', 'CodeStatsProfileUpdate' },
    config = function()
      require('codestats').setup {
        username = 'aMorph',
        base_url = 'https://codestats.net',
        api_key = 'SFMyNTY.WVUxdmNuQm8jI01UUTNPRE09.vQOK5pHobsxgX-9Gw1vjRSg8ra8FK3buO_SnnsJszEE',
        send_on_exit = true,
        send_on_timer = true,
        timer_interval = 60000,
        curl_timeout = 5,
      }
    end,
  },
}
