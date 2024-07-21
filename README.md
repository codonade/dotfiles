# 🎨 Dotfiles

Personal configuration files for my Ubuntu setup.

## ✅ Requirements

To follow through this README, you have to install a single dependency -
[GNU Stow:](https://www.gnu.org/software/stow/)

```bash
sudo apt update
sudo apt upgrade
sudo apt install stow
```

**NOTE:** Of course, you'll need to install the applications I'm configuring here;
`stow` is only for symlinking the your `$HOME` files with mine.

## ⌨️ Getting Started

- Navigate to your `$HOME` directory: `cd ~`
- Clone the repository: `git clone https://github.com/codonade/dotfiles.git .dotfiles`
- Symlink your `$HOME` files with mine: `stow .`

### ⚠️ Disclaimers

1. I recommend backing up your own configuration files before switching to using
mine so that, if my setup breaks anything, you may easily bring back your machine
to its previous working state.
2. Files listed in [`.stow-local-ignore`](.stow-local-ignore) aren't configured
by me personally, rather they're automatically generated files, so I don't care
about committing them to source control or backing them up.

## 🪪 License

These dotfiles are under the [`MIT License.`](LICENSE.txt)

