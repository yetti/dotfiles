# Zinit's installer chunk
# https://github.com/zdharma-continuum/zinit

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt fade

# STARSHIP PROMPT

eval "$(starship init zsh)"

# HOMEBREW

eval "$(/opt/homebrew/bin/brew shellenv)"

# HISTORY

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zinit ice wait blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit ice wait atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait atinit"zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

zinit load zdharma-continuum/history-search-multi-word

zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras
source "$HOME/.local/share/zinit/plugins/tj---git-extras/etc/git-extras-completion.zsh"

zinit ice wait"0" lucid
zinit light htlsne/zinit-rbenv
zinit snippet OMZ::plugins/rails/rails.plugin.zsh
zinit snippet OMZ::plugins/bundler/bundler.plugin.zsh

zinit light aperezdc/zsh-fzy

# USER SETTINGS

# ALIASES

alias load_key="ssh-add -s /usr/local/lib/opensc-pkcs11.so"
alias unload_key="ssh-add -e /usr/local/lib/opensc-pkcs11.so"
alias full_monty="load_key && sshuttle -H -r user@jump.server 0/0 -x jump.server || unload_key"
alias kc_up=". ~/Projects/scripts/kc_up.sh"
alias maildev="npx maildev -s 2525 -w 9090"
alias be="bundle exec"

# GPG

export GPG_TTY=$(tty)

# direnv

eval "$(direnv hook zsh)"

# yarn global path

export PATH="$HOME/.yarn/bin:$PATH"

# NVM

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
