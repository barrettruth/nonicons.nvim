# nonicons.nvim

**[Nonicons](https://github.com/ya2s/nonicons) for Neovim**

![nonicons.nvim preview](https://forge.barrettruth.com/attachments/15be8172-9a1a-4751-94fb-97bf6f8b4ba5)

## Features

- Replaces [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  glyphs with nonicons font icons
- Any plugin using nvim-web-devicons works automatically

## Requirements

- [nonicons font](https://github.com/ya2s/nonicons/releases) installed
- (Optionally)
  [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

## Installation

With `vim.pack` (Neovim 0.12+):

```lua
vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://forge.barrettruth.com/barrettruth/nonicons.nvim',
})
```

## Documentation

```vim
:help nonicons
```

## FAQ

**Q: How do I integrate with plugin `X`?**

See `:help nonicons-recipes`.

## Acknowledgements

- [ya2s/nonicons](https://github.com/ya2s/nonicons) — icon font
- [ya2s/nvim-nonicons](https://github.com/ya2s/nvim-nonicons) — original plugin
