local mapping = require('nonicons.mapping')

local function char(name)
  local code = mapping[name]
  if code then
    return vim.fn.nr2char(code)
  end
end

local fallback_icon

local ext_map = {
  lua = 'lua',
  luac = 'lua',
  luau = 'lua',

  js = 'javascript',
  cjs = 'javascript',
  mjs = 'javascript',
  jsx = 'react',
  tsx = 'react',

  ts = 'typescript',
  cts = 'typescript',
  mts = 'typescript',
  ['d.ts'] = 'typescript',

  py = 'python',
  pyc = 'python',
  pyd = 'python',
  pyi = 'python',
  pyo = 'python',
  pyw = 'python',
  pyx = 'python',

  rb = 'ruby',
  rake = 'ruby',
  gemspec = 'ruby',

  rs = 'rust',
  rlib = 'rust',

  go = 'go',

  c = 'c',
  h = 'c',

  cpp = 'c-plusplus',
  cc = 'c-plusplus',
  cxx = 'c-plusplus',
  ['c++'] = 'c-plusplus',
  cp = 'c-plusplus',
  cppm = 'c-plusplus',
  cxxm = 'c-plusplus',
  mpp = 'c-plusplus',
  hh = 'c-plusplus',
  hpp = 'c-plusplus',
  hxx = 'c-plusplus',
  ixx = 'c-plusplus',
  mm = 'c-plusplus',

  cs = 'c-sharp',
  cshtml = 'c-sharp',
  csproj = 'c-sharp',

  java = 'java',
  jar = 'java',

  kt = 'kotlin',
  kts = 'kotlin',

  swift = 'swift',

  dart = 'dart',

  elm = 'elm',

  ex = 'elixir',
  exs = 'elixir',
  eex = 'elixir',
  heex = 'elixir',
  leex = 'elixir',

  vue = 'vue',

  svelte = 'svelte',

  html = 'html',
  htm = 'html',

  css = 'css',
  scss = 'css',
  sass = 'css',
  less = 'css',
  styl = 'css',

  json = 'json',
  json5 = 'json',
  jsonc = 'json',
  cson = 'json',

  yaml = 'yaml',
  yml = 'yaml',

  toml = 'toml',

  md = 'markdown',
  markdown = 'markdown',
  mdx = 'markdown',

  php = 'php',
  ['blade.php'] = 'php',

  pl = 'perl',
  pm = 'perl',

  r = 'r',
  R = 'r',
  rmd = 'r',

  scala = 'scala',
  sc = 'scala',
  sbt = 'scala',

  vim = 'vim',

  graphql = 'graphql',
  gql = 'graphql',

  tf = 'terraform',
  tfvars = 'terraform',

  Dockerfile = 'docker',
  dockerignore = 'docker',

  angular = 'angular',

  sh = 'terminal',
  bash = 'terminal',
  zsh = 'terminal',
  fish = 'terminal',
  ksh = 'terminal',
  csh = 'terminal',
  terminal = 'terminal',
  ps1 = 'terminal',

  nix = 'code',

  sql = 'database',
  sqlite = 'database',
  sqlite3 = 'database',
  db = 'database',
  dump = 'database',

  rss = 'rss',
  tmux = 'tmux',
  nginx = 'nginx',

  diff = 'diff',
  patch = 'diff',

  lock = 'lock',
  lck = 'lock',

  conf = 'gear',
  cfg = 'gear',
  ini = 'gear',
  env = 'key',

  git = 'git-branch',

  license = 'law',

  log = 'log',

  xml = 'code',
  xslt = 'code',

  tex = 'book',
  bib = 'book',

  png = 'image',
  jpg = 'image',
  jpeg = 'image',
  gif = 'image',
  bmp = 'image',
  ico = 'image',
  webp = 'image',
  avif = 'image',
  svg = 'image',
  tiff = 'image',
  jxl = 'image',

  zip = 'file-zip',
  gz = 'file-zip',
  tgz = 'file-zip',
  ['7z'] = 'file-zip',
  rar = 'file-zip',
  bz = 'file-zip',
  bz2 = 'file-zip',
  bz3 = 'file-zip',
  xz = 'file-zip',
  zst = 'file-zip',
  txz = 'file-zip',
  tar = 'file-zip',

  bin = 'file-binary',
  exe = 'file-binary',
  dll = 'file-binary',
  so = 'file-binary',
  o = 'file-binary',
  a = 'file-binary',
  elf = 'file-binary',
  ko = 'file-binary',
  lib = 'file-binary',
  out = 'file-binary',

  mp3 = 'play',
  mp4 = 'play',
  mkv = 'play',
  mov = 'play',
  avi = 'play',
  flac = 'play',
  ogg = 'play',
  wav = 'play',
  webm = 'play',
  aac = 'play',
  m4a = 'play',
  m4v = 'play',
  ogv = 'play',
  wma = 'play',
  wmv = 'play',

  ttf = 'typography',
  otf = 'typography',
  woff = 'typography',
  woff2 = 'typography',
  eot = 'typography',

  pdf = 'file',
  doc = 'file',
  docx = 'file',
  ppt = 'file',
  pptx = 'file',
  xls = 'file',
  xlsx = 'file',
  csv = 'file',
  txt = 'file',

  erl = 'code',
  hrl = 'code',
  hs = 'code',
  lhs = 'code',
  ml = 'code',
  mli = 'code',
  clj = 'code',
  cljs = 'code',
  cljc = 'code',
  edn = 'code',
  fnl = 'code',
  el = 'code',
  elc = 'code',
  eln = 'code',
  nim = 'code',
  zig = 'code',
  odin = 'code',
  gleam = 'code',
  cr = 'code',
  jl = 'code',
  nu = 'code',
  pro = 'code',
  scm = 'code',
  rkt = 'code',
  sol = 'code',
  wasm = 'code',
  ipynb = 'code',
  gradle = 'code',
  groovy = 'code',
  ino = 'code',
  prisma = 'code',
  astro = 'code',
  hx = 'code',
  d = 'code',
  ada = 'code',
  adb = 'code',
  ads = 'code',
  f90 = 'code',
  vala = 'code',
  v = 'code',
  vh = 'code',
  vhd = 'code',
  vhdl = 'code',
  sv = 'code',
  svh = 'code',
  mo = 'code',
  mojo = 'code',
}

local filename_map = {
  ['dockerfile'] = 'docker',
  ['containerfile'] = 'docker',
  ['docker-compose.yml'] = 'docker',
  ['docker-compose.yaml'] = 'docker',
  ['compose.yml'] = 'docker',
  ['compose.yaml'] = 'docker',
  ['.dockerignore'] = 'docker',

  ['.gitignore'] = 'git-branch',
  ['.gitconfig'] = 'git-branch',
  ['.gitattributes'] = 'git-branch',
  ['.gitmodules'] = 'git-branch',
  ['.git-blame-ignore-revs'] = 'git-branch',
  ['.mailmap'] = 'git-branch',
  ['commit_editmsg'] = 'git-commit',

  ['.bashrc'] = 'terminal',
  ['.bash_profile'] = 'terminal',
  ['.zshrc'] = 'terminal',
  ['.zshenv'] = 'terminal',
  ['.zprofile'] = 'terminal',
  ['makefile'] = 'terminal',
  ['gnumakefile'] = 'terminal',
  ['.justfile'] = 'terminal',
  ['justfile'] = 'terminal',

  ['.eslintrc'] = 'eslint',
  ['.eslintignore'] = 'eslint',
  ['eslint.config.js'] = 'eslint',
  ['eslint.config.cjs'] = 'eslint',
  ['eslint.config.mjs'] = 'eslint',
  ['eslint.config.ts'] = 'eslint',

  ['.prettierrc'] = 'prettier',
  ['.prettierignore'] = 'prettier',
  ['.prettierrc.js'] = 'prettier',
  ['.prettierrc.cjs'] = 'prettier',
  ['.prettierrc.mjs'] = 'prettier',
  ['.prettierrc.json'] = 'prettier',
  ['.prettierrc.json5'] = 'prettier',
  ['.prettierrc.toml'] = 'prettier',
  ['.prettierrc.yaml'] = 'prettier',
  ['.prettierrc.yml'] = 'prettier',
  ['prettier.config.js'] = 'prettier',
  ['prettier.config.cjs'] = 'prettier',
  ['prettier.config.mjs'] = 'prettier',
  ['prettier.config.ts'] = 'prettier',

  ['.babelrc'] = 'babel',

  ['package.json'] = 'npm',
  ['package-lock.json'] = 'npm',
  ['.npmrc'] = 'npm',
  ['.npmignore'] = 'npm',

  ['pnpm-lock.yaml'] = 'yarn',
  ['pnpm-workspace.yaml'] = 'package',
  ['.pnpmfile.cjs'] = 'npm',
  ['bun.lock'] = 'package',
  ['bun.lockb'] = 'package',

  ['tsconfig.json'] = 'typescript',

  ['license'] = 'law',
  ['license.md'] = 'law',
  ['copying'] = 'law',
  ['copying.lesser'] = 'law',
  ['unlicense'] = 'law',

  ['tmux.conf'] = 'tmux',
  ['tmux.conf.local'] = 'tmux',

  ['readme'] = 'book',
  ['readme.md'] = 'book',

  ['go.mod'] = 'go',
  ['go.sum'] = 'go',
  ['go.work'] = 'go',

  ['.vimrc'] = 'vim',
  ['.gvimrc'] = 'vim',
  ['_vimrc'] = 'vim',
  ['_gvimrc'] = 'vim',

  ['next.config.js'] = 'next',
  ['next.config.cjs'] = 'next',
  ['next.config.ts'] = 'next',

  ['svelte.config.js'] = 'svelte',

  ['mix.lock'] = 'elixir',

  ['.env'] = 'key',

  ['config'] = 'gear',
  ['.editorconfig'] = 'gear',

  ['procfile'] = 'server',

  ['Gemfile'] = 'ruby',
  ['rakefile'] = 'ruby',

  ['Jenkinsfile'] = 'gear',

  ['.gitlab-ci.yml'] = 'logo-github',

  ['security'] = 'shield',
  ['security.md'] = 'shield',

  ['robots.txt'] = 'globe',

  ['vite.config.js'] = 'code',
  ['vite.config.ts'] = 'code',
  ['vite.config.cjs'] = 'code',
  ['vite.config.cts'] = 'code',
  ['vite.config.mjs'] = 'code',
  ['vite.config.mts'] = 'code',

  ['build.gradle'] = 'code',
  ['settings.gradle'] = 'code',

  ['pom.xml'] = 'code',

  ['hyprland.conf'] = 'gear',
  ['hyprlock.conf'] = 'gear',
  ['hypridle.conf'] = 'gear',
  ['hyprpaper.conf'] = 'gear',

  ['cmakelists.txt'] = 'code',
  ['code_of_conduct'] = 'book',
  ['code_of_conduct.md'] = 'book',
}

local function resolve(name, ext)
  if ext and ext_map[ext] then
    return char(ext_map[ext])
  end
  if name then
    local lower = name:lower()
    if filename_map[lower] then
      return char(filename_map[lower])
    end
    local dot_ext = lower:match('%.(.+)$')
    if dot_ext and ext_map[dot_ext] then
      return char(ext_map[dot_ext])
    end
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
      local nonicons_name = ext_map[ft]
      icon = nonicons_name and char(nonicons_name) or fallback_icon
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
      local nonicons_name = ext_map[ft]
      icon = nonicons_name and char(nonicons_name) or fallback_icon
    end
    return icon, color, cterm_color
  end

  local orig_get_icon_color_by_filetype = devicons.get_icon_color_by_filetype
  devicons.get_icon_color_by_filetype = function(ft, opts)
    local icon, color = orig_get_icon_color_by_filetype(ft, opts)
    if icon then
      local nonicons_name = ext_map[ft]
      icon = nonicons_name and char(nonicons_name) or fallback_icon
    end
    return icon, color
  end

  local orig_get_icon_cterm_color_by_filetype = devicons.get_icon_cterm_color_by_filetype
  devicons.get_icon_cterm_color_by_filetype = function(ft, opts)
    local icon, cterm_color = orig_get_icon_cterm_color_by_filetype(ft, opts)
    if icon then
      local nonicons_name = ext_map[ft]
      icon = nonicons_name and char(nonicons_name) or fallback_icon
    end
    return icon, cterm_color
  end

  local function override_tables()
    local by_ext = devicons.get_icons_by_extension()
    for ext, data in pairs(by_ext) do
      local name = ext_map[ext]
      if name then
        data.icon = char(name) or fallback_icon
      else
        data.icon = fallback_icon
      end
    end

    local by_filename = devicons.get_icons_by_filename()
    for fname, data in pairs(by_filename) do
      local name = filename_map[fname]
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
