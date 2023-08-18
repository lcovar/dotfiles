
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    jq
    zsh-vi-mode
    zsh-autosuggestions
    zsh-history-substring-search
)


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GITHUB_TOKEN=
ZSH_THEME="robbyrussell"


source $ZSH/oh-my-zsh.sh
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
eval "$(direnv hook zsh)"

up(){                                 # Go up X directories (default 1)
  if [[ "$#" -ne 1 ]]; then
    cd ..
  elif ! [[ $1 =~ '^[0-9]+$' ]]; then
    echo "Error: up should be called with the number of directories to go up. The default is 1."
  else
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
      do
        d=$d/..
      done
    d=$(echo $d | sed 's/^\///')
    cd $d
  fi
}
eval "$(starship init zsh)"
