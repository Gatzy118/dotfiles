# Git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h,Z\j \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export GOPATH=$HOME/.go
export PATH=/usr/local/smlnj/bin:$PATH
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion complete -F _todo t
alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/Documents/todo/todo.cfg'
alias vi='vim'
