export GOPATH=$HOME/gowork/
export PATH=$PATH:$GOPATH/bin
alias ddel='docker rm `docker ps -q -f status=exited`'
alias dexec='docker exec -it $0 $1'
alias ll="ls -l"
export CLICOLOR=1
export PS1="\u@\h:\w\$ "
alias getvimgo='git clone git@github.com:farazdagi/vim-go-ide.git ~/.vim_go_runtime && sh ~/.vim_go_runtime/bin/install'

alias COPYHSCTLD='yes | cp -fr $BIN_DIR * /home/mandar/temp/'
alias MSHF='mount -t vboxf cns /mnt/cns/'
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

