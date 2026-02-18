# nonicons.nvim

**[Nonicons](https://github.com/ya2s/nonicons) for Neovim**

<!-- screenshot here -->

## Features

- Replaces nvim-web-devicons glyphs with nonicons font icons
- Any plugin using nvim-web-devicons works automatically
- No `setup()` call needed

## Requirements

- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nonicons font](https://github.com/ya2s/nonicons/releases) installed

## Installation

Install with your package manager of choice or via
[luarocks](https://luarocks.org/modules/barrettruth/nonicons.nvim):

```
luarocks install nonicons.nvim
```

## Documentation

```vim
:help nonicons.nvim
```

## FAQ

**How do I install with lazy.nvim?**

```lua
{
  'barrettruth/nonicons.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
```

## Acknowledgements

- [ya2s/nonicons](https://github.com/ya2s/nonicons) — icon font
- [ya2s/nvim-nonicons](https://github.com/ya2s/nvim-nonicons) — original plugin
