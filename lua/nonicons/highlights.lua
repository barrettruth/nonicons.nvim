local colors = require('nonicons.colors')

local M = {}

---@param icon_name string
---@return string
local function to_hl_group(icon_name)
  local parts = {}
  for part in icon_name:gmatch('[^-]+') do
    parts[#parts + 1] = part:sub(1, 1):upper() .. part:sub(2)
  end
  return 'Nonicons' .. table.concat(parts)
end

local function apply()
  for name, data in pairs(colors) do
    vim.api.nvim_set_hl(0, to_hl_group(name), { fg = data[1], ctermfg = data[2] })
  end
end

function M.setup()
  apply()

  local group = vim.api.nvim_create_augroup('NoniconsHighlights', { clear = true })
  vim.api.nvim_create_autocmd('ColorScheme', {
    group = group,
    callback = apply,
  })
end

---@param icon_name string
---@return string? hl_group
function M.get(icon_name)
  if colors[icon_name] then
    return to_hl_group(icon_name)
  end
end

return M
