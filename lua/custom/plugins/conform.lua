-- Conform: Additional formatters for Python, Django, JS/TS
-- Extends the kickstart base conform config
-- Adds LazyVim-style <leader>cf format + autoformat toggles

---@module 'lazy'
---@type LazySpec
return {
  {
    'stevearc/conform.nvim',
    keys = {
      {
        '<leader>cf',
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local formatters = require('conform').list_formatters(bufnr)
          if #formatters == 0 then
            vim.notify('No formatter configured for filetype: ' .. vim.bo[bufnr].filetype, vim.log.levels.WARN)
            return
          end
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = { 'n', 'x' },
        desc = 'Format',
      },
      {
        '<leader>cF',
        function() require('conform').format { formatters = { 'injected' }, timeout_ms = 3000 } end,
        mode = { 'n', 'x' },
        desc = 'Format Injected Langs',
      },
      {
        '<leader>stf',
        function()
          vim.g.autoformat = not vim.g.autoformat
          vim.notify('Autoformat (global): ' .. (vim.g.autoformat and 'enabled' or 'disabled'), vim.log.levels.INFO)
        end,
        desc = 'Toggle Auto Format (Global)',
      },
      {
        '<leader>stF',
        function()
          vim.b.autoformat = not vim.b.autoformat
          vim.notify('Autoformat (buffer): ' .. (vim.b.autoformat and 'enabled' or 'disabled'), vim.log.levels.INFO)
        end,
        desc = 'Toggle Auto Format (Buffer)',
      },
    },
    opts = function(_, opts)
      opts.notify_on_error = true
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Lua: stylua
      opts.formatters_by_ft.lua = { 'stylua' }

      local extras = require 'custom.extras'
      if extras.is_enabled 'python' then
        -- Python: ruff fix, format, organize imports
        opts.formatters_by_ft.python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' }
      end

      if extras.is_enabled 'django' then
        -- Django templates: djlint
        opts.formatters_by_ft.htmldjango = { 'djlint' }
      end

      if extras.is_enabled 'web' then
        -- JavaScript/TypeScript/Web + YAML/Markdown: prettier
        local prettier_fts = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'html', 'css', 'json', 'yaml', 'markdown' }
        for _, ft in ipairs(prettier_fts) do
          opts.formatters_by_ft[ft] = { 'prettierd', 'prettier', stop_after_first = true }
        end
      end

      -- Autoformat on save: respects vim.g.autoformat / vim.b.autoformat
      -- TODO: do we want this? is this working?
      opts.format_on_save = function(bufnr)
        -- Buffer-level toggle takes priority
        if vim.b[bufnr].autoformat == false then return nil end
        if vim.b[bufnr].autoformat == true then return { timeout_ms = 3000, lsp_format = 'fallback' } end
        -- Fall back to global toggle (default: disabled)
        if not vim.g.autoformat then return nil end
        return { timeout_ms = 3000, lsp_format = 'fallback' }
      end

      -- Custom formatter configs
      opts.formatters = opts.formatters or {}
      opts.formatters.djlint = {
        command = vim.fn.stdpath 'data' .. '/mason/bin/djlint',
        args = { '--quiet', '--reformat', '-' },
        stdin = true,
      }
      opts.formatters.injected = { options = { ignore_errors = true } }

      return opts
    end,
  },
}
