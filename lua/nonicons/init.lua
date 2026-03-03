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

---@type table<string, integer>
M.mapping = require('nonicons.mapping')

---@param name string Icon name
---@return string? glyph
---@return string? hl_group
function M.get(name)
  local code = M.mapping[name]
  if code then
    local hl = require('nonicons.highlights').get(name)
    return vim.fn.nr2char(code), hl
  end
end

function M.apply()
  ensure_initialized()
  require('nonicons.highlights').setup()
  if config.override then
    require('nonicons.override').apply()
  end
end

---@param name string? Filename (e.g. `'init.lua'`)
---@param ext string? File extension (e.g. `'lua'`)
---@return string? glyph
---@return string? hl_group
function M.get_icon(name, ext)
  local key = require('nonicons.resolve').resolve_name(name, ext)
  if key then
    return M.get(key)
  end
end

---@param ft string Vim filetype
---@return string? glyph
---@return string? hl_group
function M.get_icon_by_filetype(ft)
  local key = require('nonicons.resolve').resolve_filetype(ft)
  if key then
    return M.get(key)
  end
end

return M
