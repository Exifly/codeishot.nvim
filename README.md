# CodeIsHot.nvim

CodeIsHot is an innovative Neovim plugin designed to streamline the sharing of code snippets. Effortlessly share your selected code right from Neovim to your specified endpoint.

## Features

- Share code snippets directly from the visual mode in Neovim.
- Seamless integration with a custom API for sending and retrieving code snippets.
- User-friendly and lightweight.

## Prerequisites

- Neovim version 0.7.0 or higher
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

## Installation

Install CodeIsHot using your preferred package manager.

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'exifly/codeishot.nvim'
Plug 'nvim-lua/plenary.nvim'
```

Using [Lazy](https://github.com/junegunn/vim-plug):
```vim
{ 'exifly/codeishot.nvim' }
```

## Configuration
Add the following to your Neovim configuration to set up the plugin:

```lua
require('codeishot').setup({
    -- Configuration options here
})
```

Example key binding in visual mode:

```lua
vim.keymap.set("v", "<C-S-l>", function()
    -- Actions to perform when the keybinding is triggered
end)
```

## Usage
- Highlight the code in visual mode.
- Press your configured keybinding (e.g., <C-S-l>) to share the snippet.
- The plugin posts the snippet on CodeisHot and displays the snippet endpoint.

## Contributing
Contributions to Codeishot are welcome! Feel free to fork the repo and submit pull requests.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

