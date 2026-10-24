# >> My .bashrc <<

# ===============================================================================================================
# 0- Sistema:
# ===============================================================================================================

# Definições globais
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Binários no PATH
while IFS= read -r -d '' dir; do
    export PATH="$dir:$PATH"
done < <(find "$HOME/.local/bin" -type d -print0)

# ===============================================================================================================
# 1- Dev:
# ===============================================================================================================

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo
. "$HOME/.cargo/env"

# ===============================================================================================================
# 2- Startup:
# ===============================================================================================================

eval "$(zoxide init bash)"

export MCFLY_FUZZY=2
eval "$(mcfly init bash)"

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Exports
if [ -f ~/.exports ]; then
    source ~/.exports
fi

# ===============================================================================================================
# 3- Rice:
# ===============================================================================================================

cmatrix -s
fastfetch
