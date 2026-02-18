local M = {}

function M.check()
  vim.health.start('nonicons.nvim')

  local ok, devicons = pcall(require, 'nvim-web-devicons')
  if ok and devicons then
    vim.health.ok('nvim-web-devicons available')
  else
    vim.health.error('nvim-web-devicons not found')
  end

  local result = vim.fn.system({ 'fc-list', ':family=nonicons' })
  if result ~= '' then
    vim.health.ok('nonicons font installed')
  else
    vim.health.warn('nonicons font not detected (fc-list :family=nonicons returned empty)')
  end

  local mapping = require('nonicons.mapping')
  local count = vim.tbl_count(mapping)
  if count > 0 then
    vim.health.ok('mapping loaded (' .. count .. ' icons)')
  else
    vim.health.error('mapping table is empty')
  end
end

return M
