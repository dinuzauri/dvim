local M = {}

local defaults = {
  python = false,
  django = false,
  web = false,
  http = false,
}

local tool_groups = {
  base = { 'lua-language-server', 'stylua' },
  python = { 'ty', 'ruff' },
  django = { 'django-template-lsp', 'djlint' },
  web = { 'vtsls', 'prettierd', 'prettier' },
}

local config_path = vim.fs.joinpath(vim.fn.stdpath 'data', 'extras.json')

local function load()
  if not vim.uv.fs_stat(config_path) then return vim.deepcopy(defaults) end

  local lines = vim.fn.readfile(config_path)

  local ok, saved = pcall(vim.json.decode, table.concat(lines, '\n'))
  if not ok or type(saved) ~= 'table' then error('Invalid extras configuration: ' .. config_path) end

  local settings = vim.deepcopy(defaults)
  for profile in pairs(defaults) do
    if type(saved[profile]) == 'boolean' then settings[profile] = saved[profile] end
  end
  return settings
end

local enabled = load()

function M.is_enabled(profile)
  return enabled[profile] or (profile == 'python' and enabled.django)
end

function M.tools(profile)
  return tool_groups[profile] or {}
end

function M.mason_tools()
  local tools = vim.deepcopy(tool_groups.base)
  for _, profile in ipairs { 'python', 'django', 'web' } do
    if M.is_enabled(profile) then vim.list_extend(tools, tool_groups[profile]) end
  end
  return tools
end

local function save()
  local directory = vim.fn.fnamemodify(config_path, ':h')
  if vim.fn.mkdir(directory, 'p') ~= 1 and not vim.uv.fs_stat(directory) then error('Unable to create extras directory: ' .. directory) end

  local encoded = vim.json.encode(enabled)
  local temp_path = config_path .. '.tmp'
  if vim.fn.writefile({ encoded }, temp_path) ~= 0 then error('Unable to save extras configuration: ' .. temp_path) end
  local rename_ok, rename_err = os.rename(temp_path, config_path)
  if not rename_ok then error('Unable to save extras configuration: ' .. rename_err) end
end

function M.set(profile, state)
  if defaults[profile] == nil then error('Unknown extra: ' .. profile) end

  enabled[profile] = state
  if profile == 'django' and enabled.django then enabled.python = true end
  if profile == 'python' and not enabled.python then enabled.django = false end
  save()

  vim.notify(('Extra %q is %s. Restart Neovim to apply the change.'):format(profile, enabled[profile] and 'enabled' or 'disabled'), vim.log.levels.INFO)
end

function M.toggle(profile)
  M.set(profile, not M.is_enabled(profile))
end

return M
