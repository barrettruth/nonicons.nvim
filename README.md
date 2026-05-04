# nonicons.nvim

**[Nonicons](https://github.com/ya2s/nonicons) for Neovim**

> [!NOTE]
> Due to GitHub's historic unreliability, development, issues, and pull requests
> have moved to [Forgejo](https://git.barrettruth.com/barrettruth/nonicons.nvim).

![nonicons.nvim preview](https://github.com/user-attachments/assets/815ff7a3-fdfc-404b-bee9-bc5bd933db9a)

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
  'https://git.barrettruth.com/barrettruth/nonicons.nvim',
})
```

Or via [luarocks](https://luarocks.org/modules/barrettruth/nonicons.nvim):

```
luarocks install nonicons.nvim
```

## Documentation

```vim
:help nonicons.nvim
```

## FAQ

**Q: How do I integrate with plugin `X`?**

See `:help nonicons-recipes`.

## Acknowledgements

- [ya2s/nonicons](https://github.com/ya2s/nonicons) — icon font
- [ya2s/nvim-nonicons](https://github.com/ya2s/nvim-nonicons) — original plugin
