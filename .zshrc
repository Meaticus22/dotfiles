if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="darkblood"

plugins=(
  git 
  sudo 
  copypath 
  copyfile 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  zsh-bat 
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh


alias cat="bat"
alias env="virtualenv myenv"
alias startenv="source myenv/bin/activate"
alias python3=ptpython
alias du=dust
# source ~/powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"

export TERM=xterm-256color
mfetch
