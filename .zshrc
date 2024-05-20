# DOCS: https://gist.github.com/mgedmin/2762225 (Xterm Colors)

# Loads and initializes the completion engine.
autoload -Uz compinit
compinit

# Saves history to a HOME file, ignoring duplicates.
setopt histignorealldups sharehistory
HISTFILE='/home/codonade/.zshistory'
# Limits the history capacity to 1000 lines.
HISTSIZE=1000
SAVEHIST=1000

# Zap: A minimal Zsh plugin manager.
[ -f "$HOME/.local/share/zap/zap.zsh" ]
source "$HOME/.local/share/zap/zap.zsh"

# Zsh Syntax Highlighting: Fish shell like syntax highlighting for Zsh.
# NOTE: Intentionally mimics Microsoft's Cambell colorscheme.
plug 'zsh-users/zsh-syntax-highlighting'
# Highlights commands with Bright Yellow, even if they're unknown.
ZSH_HIGHLIGHT_STYLES[command]='fg=011'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=011'
ZSH_HIGHLIGHT_STYLES[function]='fg=011'
ZSH_HIGHLIGHT_STYLES[alias]='fg=011'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=011'
# Highlights strings with Cyan.
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=006'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=006'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=006'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=006'
# Highlights options with Bright Gray.
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=008'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=008'
# Removes the underlines from paths.
ZSH_HIGHLIGHT_STYLES[path]='underline'

# Zsh Autosuggestions: Fish-like autosuggestions for Zsh.
plug "zsh-users/zsh-autosuggestions"
# Highlights suggestions with Bright Gray.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=008"

# Neovim: Vim-fork focused on extensibility and usability.
export PATH="/usr/local/bin/nvim/bin:$PATH"
# Rust: Empowering everyone to build reliable and efficient software.
source "$HOME/.cargo/env"
# Starship: The minimal, blazing-fast, and infinitely customizable prompt!
eval "$(starship init zsh)"
# Zoxide: A smarter cd command.
eval "$(zoxide init zsh)"

# FNM: Fast and simple Node.js version manager, built in Rust.
export PATH="/home/codonade/.local/share/fnm:$PATH"
eval "`fnm env`"

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

# Launches Neovim text editor.
alias nv='nvim'

# Initializes a new Git repository.
alias gi='git init'
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
alias gf='git push --force'
# WARN: Renames the last Git commit.
alias gb='git rebase -i HEAD~1 && git push --force'
# Logs all Git commits.
alias gl='git log'
# Removes the whole Git history.
alias gd='rd .git'
# Resets the Git history.
alias gr='gd && gi'

# Builds a Rust Cargo environment.
alias cb='cargo build'
# Runs a Rust Cargo environment.
alias cr='cargo run'
# Formats Rust code with Cargo Format.
alias cf='cargo fmt'
# Compiles Rust documentation.
alias co='cargo doc'
