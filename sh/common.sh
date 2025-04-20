
error() { echo -e "\e[31m$@\e[0m"; exit 1; }
ok()    { echo -e "\e[32m$@\e[0m"; }
warn()  { echo -e "\e[33m$@\e[0m"; }
msg()   { echo -e "\e[36m$@\e[0m"; }
hist()  { history | sed -e 's/^ *[0-9]* *//'; }

join() {
    local s=$1
    shift
    (set -- $@; IFS=$s ; echo "$*")
}
# join : 1 2 3 4
# a=( hello there i diii)
# join " " ${a[@]}

show_functions() {
    declare -F | sed -e 's/declare -f //' -e '/^_/d'
}

confirm() {
    local x
    warn "$@"
    warn "Type 'yes' to confirm:"
    read x
    [[ $x == yes ]] && {
        ok 'confirmed...'
        return 0
    } || {
        error 'skipping...'
        return 1
    }
}


prettyjson() {
    local tmp=$(mktemp)
    local path=${1:-.}
    path=$(readlink -f $path)
    [[ -f $path ]] && {
        python3 -m json.tool $path > $tmp
        mv $tmp $path
        return
    }
    [[ -d $path ]] && {
        for f in ${path}/*.json ; do
            python3 -m json.tool $f > $tmp
            mv $tmp $f
        done
    }
}


latex() {
    pdflatex $1 >/dev/null
    rm -rf ./*.log ./*.aux
}

git_reclone() {
    local d=$(basename $(pwd))
    local u=$(git config --get remote.origin.url)
    [[ -z $u ]] && {
        error "No git in $d"
        return 1
    }
    confirm "You are about to re-clone $u" || {
        return 1
    }
    cd ..
    rm -rf $d
    git clone $u
    cd $d
    return 0
}

cut_mp3() {
    local file=$1
    local new=$2
    ffmpeg -i "${file}" -c copy \
        -metadata title="new title" -ss 00:00 -to 22:57 \
        "$new"
}

