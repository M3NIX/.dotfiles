# .dotfiles

## getting started

```
cd ~
git clone --recurse-submodules https://github.com/M3NIX/.dotfiles.git && cd .dotfiles
./install.sh
```

## configuration

- to install all neovim plugins run `nvim +PackerSync`
- to select a base16-theme run `b16 <theme>` e.g. `b16 google-dark`
- keyboard layout can be set in `x/.xinitrc`
- export your display settings to `~/.screenlayout/config.sh` with ARandR
- set your background image with `feh --bg-fill '<path/to/file>'`
