local mapping = require('nonicons.mapping')
local resolve_mod = require('nonicons.resolve')

---@param name string
---@return string?
local function char(name)
  local code = mapping[name]
  if code then
    return vim.fn.nr2char(code)
  end
end

---@type string
local fallback_icon

---@param name string?
---@param ext string?
---@return string
local function resolve(name, ext)
  local key = resolve_mod.resolve_name(name, ext)
  if key then
    return char(key)
  end
  return fallback_icon
end

local M = {}

function M.apply()
  local ok, devicons = pcall(require, 'nvim-web-devicons')
  if not ok then
    return
  end

  fallback_icon = char('file')

  local orig_get_icon = devicons.get_icon
  devicons.get_icon = function(name, ext, opts)
    local icon, hl = orig_get_icon(name, ext, opts)
    if icon then
      icon = resolve(name, ext)
    end
    return icon, hl
  end

  local orig_get_icon_by_filetype = devicons.get_icon_by_filetype
  devicons.get_icon_by_filetype = function(ft, opts)
    local icon, hl = orig_get_icon_by_filetype(ft, opts)
    if icon then
      local key = resolve_mod.resolve_filetype(ft)
      icon = key and char(key) or fallback_icon
    end
    return icon, hl
  end

  local orig_get_icon_colors = devicons.get_icon_colors
  devicons.get_icon_colors = function(name, ext, opts)
    local icon, color, cterm_color = orig_get_icon_colors(name, ext, opts)
    if icon then
      icon = resolve(name, ext)
    end
    return icon, color, cterm_color
  end

  local orig_get_icon_color = devicons.get_icon_color
  devicons.get_icon_color = function(name, ext, opts)
    local icon, color = orig_get_icon_color(name, ext, opts)
    if icon then
      icon = resolve(name, ext)
    end
    return icon, color
  end

  local orig_get_icon_cterm_color = devicons.get_icon_cterm_color
  devicons.get_icon_cterm_color = function(name, ext, opts)
    local icon, cterm_color = orig_get_icon_cterm_color(name, ext, opts)
    if icon then
      icon = resolve(name, ext)
    end
    return icon, cterm_color
  end

  local orig_get_icon_colors_by_filetype = devicons.get_icon_colors_by_filetype
  devicons.get_icon_colors_by_filetype = function(ft, opts)
    local icon, color, cterm_color = orig_get_icon_colors_by_filetype(ft, opts)
    if icon then
      local key = resolve_mod.resolve_filetype(ft)
      icon = key and char(key) or fallback_icon
    end
    return icon, color, cterm_color
  end

  local orig_get_icon_color_by_filetype = devicons.get_icon_color_by_filetype
  devicons.get_icon_color_by_filetype = function(ft, opts)
    local icon, color = orig_get_icon_color_by_filetype(ft, opts)
    if icon then
      local key = resolve_mod.resolve_filetype(ft)
      icon = key and char(key) or fallback_icon
    end
    return icon, color
  end

  local orig_get_icon_cterm_color_by_filetype = devicons.get_icon_cterm_color_by_filetype
  devicons.get_icon_cterm_color_by_filetype = function(ft, opts)
    local icon, cterm_color = orig_get_icon_cterm_color_by_filetype(ft, opts)
    if icon then
      local key = resolve_mod.resolve_filetype(ft)
      icon = key and char(key) or fallback_icon
    end
    return icon, cterm_color
  end

  local function override_tables()
    local by_ext = devicons.get_icons_by_extension()
    for ext, data in pairs(by_ext) do
      local name = resolve_mod.ext_map[ext] or resolve_mod.ext_map[ext:lower()]
      if name then
        data.icon = char(name) or fallback_icon
      else
        data.icon = fallback_icon
      end
    end

    local by_filename = devicons.get_icons_by_filename()
    for fname, data in pairs(by_filename) do
      local name = resolve_mod.filename_map[fname] or resolve_mod.filename_map[fname:lower()]
      if name then
        data.icon = char(name) or fallback_icon
      else
        data.icon = fallback_icon
      end
    end

    devicons.set_default_icon(fallback_icon)
  end

  override_tables()

  local group = vim.api.nvim_create_augroup('Nonicons', { clear = true })

  vim.api.nvim_create_autocmd('OptionSet', {
    pattern = 'background',
    group = group,
    callback = function()
      vim.schedule(override_tables)
    end,
  })

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = group,
    callback = function()
      vim.schedule(override_tables)
    end,
  })
end

return M
