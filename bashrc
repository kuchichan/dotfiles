#
# ~/.bashrc
#
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Different vim settings for different application
alias vim-dev='vim -u ~/.vimrc_dev'
alias gvim-dev='vim -g -u ~/.vimrc_dev'
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else 
  # PS1="\e[0;36m[\u@\h \W ] $\e] \$(parse_git_branch)\e[033[00m\e $"
  PS1="\[\033[0;36m\][\u@\h \W]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "
fi 

alias trsh='mv --target-directory="$HOME/.Trash"'
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source $HOME/.local/bin/virtualenvwrapper.sh

# Script for autocompletion in exercism
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
