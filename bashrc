export GOPATH=$HOME/gowork/
export PATH=$PATH:$GOPATH/bin
alias ddel='docker rm `docker ps -q -f status=exited`'
alias dexec='docker exec -it $0 $1'
alias ll="ls -l"
export CLICOLOR=1
export PS1="\u@\h:\w\$ "
alias getvimgo='git clone git@github.com:farazdagi/vim-go-ide.git ~/.vim_go_runtime && sh ~/.vim_go_runtime/bin/install'
