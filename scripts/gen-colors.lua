#!/usr/bin/env lua

local resolve = dofile('lua/nonicons/resolve.lua')
local ext_icons = dofile('/tmp/devicons_ext.lua')
local fname_icons = dofile('/tmp/devicons_fname.lua')

local colors = {}

for ext, icon_name in pairs(resolve.ext_map) do
  if not colors[icon_name] and ext_icons[ext] then
    colors[icon_name] = {
      ext_icons[ext].color,
      tonumber(ext_icons[ext].cterm_color),
    }
  end
end

for fname, icon_name in pairs(resolve.filename_map) do
  if not colors[icon_name] and fname_icons[fname] then
    colors[icon_name] = {
      fname_icons[fname].color,
      tonumber(fname_icons[fname].cterm_color),
    }
  end
end

local names = {}
for name in pairs(colors) do
  names[#names + 1] = name
end
table.sort(names)

io.write('---@type table<string, { [1]: string, [2]: integer }>\n')
io.write('local M = {\n')
for _, name in ipairs(names) do
  local c = colors[name]
  io.write(string.format("  ['%s'] = { '%s', %d },\n", name, c[1], c[2]))
end
io.write('}\n\nreturn M\n')
