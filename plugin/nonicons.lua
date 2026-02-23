if vim.g.loaded_nonicons then
  return
end
vim.g.loaded_nonicons = 1

require('nonicons').apply()

vim.api.nvim_create_user_command('NoniconsHiTest', function()
  require('nonicons.hi-test')()
end, { desc = 'nonicons: display all icons' })
