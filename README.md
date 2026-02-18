# nonicons.nvim

**Nonicons for Neovim**

Replace [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
glyphs with icons from the [nonicons](https://github.com/yamatsum/nonicons)
font. Any plugin that uses nvim-web-devicons automatically displays nonicons
glyphs.

## Requirements

- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nonicons font](https://github.com/yamatsum/nonicons/releases) installed in
  your terminal

## Installation

Install the nonicons font and configure your terminal to use it as a fallback:

**ghostty**

```
font-family = Nonicons
font-family = YourMainFont
```

**kitty**

```
symbol_map U+F101-U+F219 Nonicons
```

**wezterm**

```lua
config.font = wezterm.font_with_fallback({
  'YourMainFont',
  'Nonicons',
})
```

Install with your package manager of choice or via
[luarocks](https://luarocks.org/modules/barrettruth/nonicons.nvim):

```
luarocks install nonicons.nvim
```

**lazy.nvim**

```lua
{
  'barrettruth/nonicons.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
```

The plugin applies overrides automatically. No `setup()` call is needed.

## Configuration

Configure via `vim.g.nonicons` before the plugin loads:

```lua
vim.g.nonicons = {
  override = true,  -- default; set false to disable devicons wrapping
}
```

## Usage

```lua
local get = require('nonicons').get

get('lua')        -- returns the nonicons lua character
get('python')     -- returns the nonicons python character
get('git-branch') -- returns the nonicons git-branch character
```

The raw mapping table is available for advanced use:

```lua
local code = require('nonicons').mapping['lua']
local icon = vim.fn.nr2char(code)
```

## Recipes

**lualine** — mode icons:

```lua
local get = require('nonicons').get

require('lualine').setup({
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(mode)
          local map = {
            NORMAL = get('vim-normal-mode'),
            INSERT = get('vim-insert-mode'),
            VISUAL = get('vim-visual-mode'),
            REPLACE = get('vim-replace-mode'),
            COMMAND = get('vim-command-mode'),
          }
          return map[mode] or mode
        end,
      },
    },
  },
})
```

**nvim-notify**:

```lua
require('notify').setup({
  icons = {
    ERROR = require('nonicons').get('x-circle'),
    WARN = require('nonicons').get('alert'),
    INFO = require('nonicons').get('info'),
    DEBUG = require('nonicons').get('bug'),
    TRACE = require('nonicons').get('play'),
  },
})
```

**mason.nvim**:

```lua
require('mason').setup({
  ui = {
    icons = {
      package_installed = require('nonicons').get('check'),
      package_pending = require('nonicons').get('sync'),
      package_uninstalled = require('nonicons').get('x'),
    },
  },
})
```

**oil.nvim**, **fzf-lua**, **telescope.nvim** — no configuration needed. These
plugins read from nvim-web-devicons which nonicons.nvim wraps automatically.

**nvim-tree**:

```lua
local get = require('nonicons').get

require('nvim-tree').setup({
  renderer = {
    icons = {
      glyphs = {
        default = get('file'),
        symlink = get('file-symlink-file'),
        folder = {
          default = get('file-directory-fill'),
          open = get('file-directory-open-fill'),
          symlink = get('file-submodule'),
          empty = get('file-directory-outline'),
          arrow_open = get('chevron-down'),
          arrow_closed = get('chevron-right'),
        },
      },
    },
  },
})
```

## Documentation

```vim
:help nonicons.nvim
```

## Acknowledgements

- [yamatsum/nonicons](https://github.com/yamatsum/nonicons) — icon font
- [ya2s/nvim-nonicons](https://github.com/ya2s/nvim-nonicons) — original plugin
