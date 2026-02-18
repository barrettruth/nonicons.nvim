rockspec_format = '3.0'
package = 'nonicons.nvim'
version = 'scm-1'

source = {
  url = 'git+https://github.com/barrettruth/nonicons.nvim.git',
}

description = {
  summary = 'Nonicons for Neovim',
  homepage = 'https://github.com/barrettruth/nonicons.nvim',
  license = 'MIT',
}

dependencies = {
  'lua >= 5.1',
}

build = {
  type = 'builtin',
}
