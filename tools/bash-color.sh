#enables colorin the terminal bash shell export
export CLICOLOR=1

#sets up thecolor scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad

#sets up the prompt color (currently a green similar to linux terminal)
MYIP=`ifconfig eth0 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`
export PS1="\[\033[01;33m\]\u\[\033[01;31m\]@\[\033[01;33m\]$MYIP\[\033[00m\]:\[\033[01;37m\]\w\[\033[01;31m\]\$\[\e[0m\] "
