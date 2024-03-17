# 🎨 Dotfiles

Personal configuration files for my Ubuntu setup.

## ✅ Requirements

```zsh
sudo apt update
sudo apt upgrade
sudo apt install stow
```

**NOTE:** `stow` is only used for symlinking your `$HOME` files with mine. You
still need to `install` all the applications that I use to leverage these dotfiles.

## ⬇️ Installation

```zsh
cd ~
git clone https://github.com/codonade/dotfiles.git .dotfiles
stow .
```
