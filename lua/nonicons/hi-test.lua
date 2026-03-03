local mapping = require('nonicons.mapping')
local resolve = require('nonicons.resolve')

---@param name string
---@return string
local function char(name)
  local code = mapping[name]
  if code then
    return vim.fn.nr2char(code)
  end
  return '?'
end

---@param t table<string, any>
---@return string[]
local function sorted_keys(t)
  local keys = {}
  for k in pairs(t) do
    keys[#keys + 1] = k
  end
  table.sort(keys)
  return keys
end

---@param t table<string, string>
---@return table<string, string[]>
local function invert(t)
  local inv = {}
  for k, v in pairs(t) do
    inv[v] = inv[v] or {}
    inv[v][#inv[v] + 1] = k
  end
  for _, list in pairs(inv) do
    table.sort(list)
  end
  return inv
end

return function()
  local lines = {} ---@type string[]

  local ext_by_icon = invert(resolve.ext_map)
  local fname_by_icon = invert(resolve.filename_map)
  local ft_by_icon = invert(resolve.ft_map)

  local icon_names = sorted_keys(mapping)

  lines[#lines + 1] = 'nonicons.nvim — icon reference'
  lines[#lines + 1] = string.rep('=', 72)
  lines[#lines + 1] = ''
  lines[#lines + 1] =
    string.format('  %-4s  %-28s  %-7s  %s', 'ICON', 'NAME', 'CODE', 'MAPPED FROM')
  lines[#lines + 1] = string.rep('-', 72)

  local highlights = require('nonicons.highlights')
  local icon_line_start = #lines
  local icon_glyphs = {} ---@type string[]

  for _, name in ipairs(icon_names) do
    local sources = {} ---@type string[]
    if ext_by_icon[name] then
      for _, ext in ipairs(ext_by_icon[name]) do
        sources[#sources + 1] = 'ext:' .. ext
      end
    end
    if fname_by_icon[name] then
      for _, fname in ipairs(fname_by_icon[name]) do
        sources[#sources + 1] = 'file:' .. fname
      end
    end
    if ft_by_icon[name] then
      for _, ft in ipairs(ft_by_icon[name]) do
        sources[#sources + 1] = 'ft:' .. ft
      end
    end

    local glyph = char(name)
    local src_str = #sources > 0 and table.concat(sources, ', ') or ''
    lines[#lines + 1] =
      string.format('  %s     %-28s  U+%04X  %s', glyph, name, mapping[name], src_str)
    icon_glyphs[#icon_glyphs + 1] = glyph
  end

  lines[#lines + 1] = ''
  lines[#lines + 1] = string.format('%d icons total', #icon_names)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  for i, name in ipairs(icon_names) do
    local hl = highlights.get(name)
    local col_start = 2
    local col_end = col_start + #icon_glyphs[i]
    vim.api.nvim_buf_add_highlight(buf, -1, hl, icon_line_start + i - 1, col_start, col_end)
  end

  vim.bo[buf].modifiable = false
  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].bufhidden = 'wipe'
  vim.api.nvim_set_current_buf(buf)
end
