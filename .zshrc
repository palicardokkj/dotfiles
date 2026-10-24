# >> My .zshrc <<

# ===============================================================================================================
# 0- Sistema:
# ===============================================================================================================

# Definições globais
if [ -f /etc/zsh/zshrc ]; then
    . /etc/zsh/zshrc
fi

# Oh My Zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Binários no PATH
export PATH="$HOME/.local/bin:$PATH"
for dir in "$HOME/.local/bin"/**/(N-/); do
    export PATH="$dir:$PATH"
done

# Mapeamentos
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# ===============================================================================================================
# 1- Dev:
# ===============================================================================================================

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo
. "$HOME/.cargo/env"

# ===============================================================================================================
# 2- Plugins Omz:
# ===============================================================================================================

# Plugins
plugins=(

  sudo
  tmux
  kate
  history
  extract
  copypath
  dockolor
  web-search
  last-working-dir
  colored-man-pages
  zsh-autosuggestions
  zsh-completions
  zsh-you-should-use
  zsh-syntax-highlighting

)

# Mapeamentos
bindkey '^s' sudo-command-line

# Omz Load
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ===============================================================================================================
# 3- Startup:
# ===============================================================================================================

eval "$(zoxide init zsh)"

export MCFLY_FUZZY=2
eval "$(mcfly init zsh)"

eval "$(oh-my-posh init zsh --config /home/pali/.workspace/my-posh-themes/ultraviolet.omp.json)"

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Exports
if [ -f ~/.exports ]; then
    source ~/.exports
fi

# ===============================================================================================================
# 4- Rice:
# ===============================================================================================================

cmatrix -s
fastfetch
