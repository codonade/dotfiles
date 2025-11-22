# - load and initializes the completion engine.
autoload -Uz compinit
compinit

# - save history to a HOME file, ignoring duplicates.
setopt histignorealldups sharehistory
HISTFILE='/home/codonade/.zshistory'
# - limit the history capacity to 1000 lines.
HISTSIZE=1000
SAVEHIST=1000

# ~ Zap
[ -f "$HOME/.local/share/zap/zap.zsh" ]
source "$HOME/.local/share/zap/zap.zsh"

# ~ Zsh Syntax Highlighting
# NOTE: Intentionally mimics Microsoft's Cambell colorscheme.
plug 'zsh-users/zsh-syntax-highlighting'
# - highlight commands with Bright Yellow, even if they're unknown.
ZSH_HIGHLIGHT_STYLES[command]='fg=011'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=011'
ZSH_HIGHLIGHT_STYLES[function]='fg=011'
ZSH_HIGHLIGHT_STYLES[alias]='fg=011'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=011'
# - highlight strings with cyan.
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=006'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=006'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=006'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=006'
# - highlight options with bright gray.
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=008'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=008'
# - remove the underlines from paths.
ZSH_HIGHLIGHT_STYLES[path]='underline'

# ~ Zsh Autosuggestions
plug "zsh-users/zsh-autosuggestions"
# - highlight suggestions with bright gray.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=008"

# ~ Neovim
export PATH="/usr/local/bin/nvim/bin:$PATH"
# ~ Rust
source "$HOME/.cargo/env"
# ~ Starship
eval "$(starship init zsh)"
# ~ Zoxide
eval "$(zoxide init zsh)"
# ~ Go
export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"

# ~ FNM
export PATH="/home/codonade/.cargo/bin/fnm:$PATH"
eval "`fnm env`"

# ~ PNPM
export PNPM_HOME="/home/codonade/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ~ Unix
# Creates a directory.
alias md='mkdir'
# Changes the current directory through Zoxide.
alias cd='z'
# Navigates up a directory.
alias cu='cd ..'
# Lists all the directory, vertically, without `.` and `..`
alias ll='ls -Al'
# Deletes a directory with all of its contents, recursively.
alias rd='rm -rf'
# Marks a file (usually a script) as executable.
alias xu='chmod +x'

# ~ Neovim
# Launches Neovim text editor.
alias nv='nvim'

# ~ Git
# Initializes a new Git repository.
alias gi='git init'
# Checkout the `main` Git branch.
alias gm='git checkout main'
# Pulls the latest Git changes.
alias gu='git pull'
# Checks-out the `main` Git branch and pulls the latest changes.
alias gum='git checkout main && git pull'
# Prints the current Git status.
alias gs='git status'
# Prints the difference.
alias ge='git diff'
# Stages all Git chagnes.
alias ga='git add -A'
# Commits staged Git changes.
alias gc='git commit'
# Pushes a Git branch.
alias gp='git push'
# Stages, commits, and pushes all Git changes.
alias gg='ga && gc && gp'
# WARN: Forces a Git branch push.
alias gf='gp --force'
# WARN: Renames the last Git commit.
alias gb='git rebase -i HEAD~1 && git push --force'
# Logs all Git commits.
alias gl='git log'
# Removes the whole Git history.
alias gd='rd .git'
# Resets the Git history.
alias gr='gd && gi'

# ~ Rust & Cargo
# Builds a Rust Cargo environment.
alias cb='cargo build'
# Runs a Rust Cargo environment.
alias cr='cargo run'
# Formats Rust code with Cargo Format.
alias cf='cargo fmt'
# Compiles Rust documentation.
alias co='cargo doc'

# ~ PNPM
# Auto-installs and runs JS packages.
alias px='pnpm dlx'
# Creates a new JS application from a template.
alias pc='pnpm create'
# Installs all `package.json` packages.
alias pi='pnpm install'
# Adds a JS package to local `dependencies`
alias pa='pnpm add'
# Adds a JS package to local `devDependencies`
alias pad='pnpm add -D'
# Updates all JS packages.
alias pu='pnpm update'
# Runs a `package.json` script.
alias pr='pnpm run'
# Runs the `package.json` `dev` script.
alias pd='pnpm run dev'
