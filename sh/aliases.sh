alias xxh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias xcp='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias gethistory="history | sed -e 's/^.......//'"
#alias fake='ssh -i ~/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@x100.fake.net'
#alias faket="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/id_rsa -t root@x100.fake.net ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -l root"
alias aptnoproxy='apt -o Acquire::http::proxy=false'
alias git2='git commit -a && git rebase -i HEAD~2 && git push -f'
alias mygit='NO_PROXY=* git \
    -c http.proxy= \
    -c https.proxy= \
    -c core.gitproxy= \
    -c core.editor=vim \
    -c user.email=someone.i.used@to.know \
    -c user.name=Dmitry \
    -c commit.template='
alias pip3proxy='sudo python3.8 -m pip --proxy=127.0.0.1:3128'

if which most >/dev/null 2>&1
then
   export MANPAGER="most"
fi

# TODO
# find . -type f \( -name "*.sh" -o -name "*.txt" \)
# find . -type f \( -name "*.fb2" -o -name "*.epub" -name "*.mobi" \) -exec cp "{}" $r/antique \;
