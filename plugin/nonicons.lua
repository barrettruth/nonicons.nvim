if vim.g.loaded_nonicons then
  return
end
vim.g.loaded_nonicons = 1

require('nonicons').apply()
