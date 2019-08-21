#enables colorin the terminal bash shell export
export CLICOLOR=1

#sets up thecolor scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad

#get git branch
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}

#sets up the prompt color (currently a green similar to linux terminal)
export PS1="\[\033[01;31m\][\[\033[01;33m\]\u@\h\[\033[00m\] \[\033[01;37m\]\w\[\033[00m\]\[\033[01;31m\]]\[\e[0m\]$(git_branch)\$ "
