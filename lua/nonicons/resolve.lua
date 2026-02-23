local M = {}

---@type table<string, string>
M.ext_map = {
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
  r = 'r',
  rmd = 'r',

  scala = 'scala',
  sc = 'scala',
  sbt = 'scala',

  vim = 'vim',

  graphql = 'graphql',
  gql = 'graphql',

  tf = 'terraform',
  tfvars = 'terraform',

  dockerfile = 'docker',
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

---@type table<string, string>
M.filename_map = {
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

  ['gemfile'] = 'ruby',
  ['rakefile'] = 'ruby',

  ['jenkinsfile'] = 'gear',

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

---@type table<string, string>
M.ft_map = {
  typescriptreact = 'react',
  javascriptreact = 'react',
  make = 'terminal',
  dockerfile = 'docker',
  gitcommit = 'git-commit',
  gitrebase = 'git-branch',
  help = 'book',
  text = 'file',
  plaintex = 'book',
  latex = 'book',
}

---@param name string? Filename (e.g. `'init.lua'`)
---@param ext string? File extension (e.g. `'lua'`)
---@return string? icon_name
function M.resolve_name(name, ext)
  if ext and M.ext_map[ext] then
    return M.ext_map[ext]
  end
  if name then
    local lower = name:lower()
    if M.filename_map[lower] then
      return M.filename_map[lower]
    end
    local last_ext = lower:match('%.([^%.]+)$')
    if last_ext and M.ext_map[last_ext] then
      return M.ext_map[last_ext]
    end
    local compound = lower:match('%.(.+)$')
    if compound and compound ~= last_ext then
      while compound do
        if M.ext_map[compound] then
          return M.ext_map[compound]
        end
        compound = compound:match('%.(.+)$')
      end
    end
  end
end

---@param ft string? Vim filetype
---@return string? icon_name
function M.resolve_filetype(ft)
  if not ft then
    return
  end
  local mapping = require('nonicons.mapping')
  if mapping[ft] then
    return ft
  end
  if M.ext_map[ft] then
    return M.ext_map[ft]
  end
  if M.ft_map[ft] then
    return M.ft_map[ft]
  end
end

return M
