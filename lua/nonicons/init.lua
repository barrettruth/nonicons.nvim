local M = {}

---@class nonicons.Config
---@field override boolean

---@type nonicons.Config
local default = {
  override = true,
}

local initialized = false

---@type nonicons.Config
local config

local function ensure_initialized()
  if initialized then
    return
  end
  local user = vim.g.nonicons or {}
  vim.validate('nonicons', user, 'table')
  vim.validate('nonicons.override', user.override, 'boolean', true)
  config = vim.tbl_deep_extend('force', default, user)
  initialized = true
end

M.mapping = require('nonicons.mapping')

function M.get(name)
  local code = M.mapping[name]
  if code then
    return vim.fn.nr2char(code)
  end
end

function M.apply()
  ensure_initialized()
  if config.override then
    require('nonicons.override').apply()
  end
end

function M.get_icon(name, ext)
  local key = require('nonicons.resolve').resolve_name(name, ext)
  if key then
    return M.get(key)
  end
end

function M.get_icon_by_filetype(ft)
  local key = require('nonicons.resolve').resolve_filetype(ft)
  if key then
    return M.get(key)
  end
end

return M
