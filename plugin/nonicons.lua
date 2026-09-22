if vim.g.loaded_nonicons then
  return
end
vim.g.loaded_nonicons = 1

pcall(function()
  require('nonicons.migration').warn_if_github_source()
end)

require('nonicons').apply()

vim.api.nvim_create_user_command('NoniconsHiTest', function()
  require('nonicons.hi-test')()
end, { desc = 'nonicons: display all icons' })
