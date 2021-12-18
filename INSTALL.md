## ⚡ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the theme with your preferred package manager:

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use '404-theme/neovim'
```

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug '404-theme/neovim', { 'branch': 'main' }
```

## 🚀 Usage

Enable the colorscheme:

```vim
" Vim Script
colorscheme purpledaze
```

```lua
-- Lua
vim.cmd[[colorscheme purpledaze]]
```

To enable the `PurpleDaze` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'purpledaze'
    -- ... your lualine config
  }
}
```
