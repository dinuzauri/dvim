-- Custom autocommands

-- Django template file type detection
vim.filetype.add {
  pattern = {
    ['.*/templates/.*%.html'] = 'htmldjango',
    ['.*/templates/partials/.*%.html'] = 'htmldjango',
  },
}

-- Autosave on InsertLeave and TextChanged
vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*',
  callback = function()
    if vim.bo.modifiable and vim.bo.modified and vim.bo.buftype == '' then
      vim.cmd 'silent! write'
    end
  end,
})

---@module 'lazy'
---@type LazySpec
return {}
