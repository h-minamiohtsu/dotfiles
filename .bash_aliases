alias ls='ls --color=auto'
alias ll='ls -AlFh --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias df='df -h'
alias grep='grep -i --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ログディレクトリへの移動
alias cdsomelog='cd [path_to_log]'

# SSH接続
alias sshsomewhere='ssh [user]@[hostname]'

# mysql
alias mysqlsomedb='mysql -u[user] -p [db_name]'

# typo
alias sl='echo "typo `ls`!!";ls'
alias gti='echo "typo `git`!!";git'

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
  PROMPT="\h@\u:\W\$(parse_git_branch) \$ "
}
function proml {
  PS1="\h@\u:\W\$(parse_git_branch) \$ "
}
proml
