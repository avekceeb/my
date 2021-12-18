#!/bin/bash

source $(readlink -f $(dirname $BASH_SOURCE))/common.sh

false | true || error "Default: pipe not fail: $LINENO"

set -o pipefail
false | true && error "Pipe should fail: $LINENO"

set +o pipefail
false | true || error "Pipe should NOT fail: $LINENO"

# |& = shorthand for 2>&1 |
err=$(ls /nonexistent |& grep 'No such')
[[ -z $err ]] && error "Shorthand: $LINENO"

# compound command
err=
( err=1 ; err=2 )  # executed in subshell
[[ ! -z $err ]] && error "Subshell: $LINENO"

{ err=3; err=4; }  # executed in current shell
[[ 4 != $err ]] && error "Current shell: $LINENO"

# arithmetic evaluation
(( 1 + 2 )) || error "Non 0 result is success: $LINENO"
(( 1 - 1 )) && error "0 is fail: $LINENO"


# execute for each positional parameter
f() {
    for x do echo -n $x ; done
}

[[ abc != $(f a b c) ]] && error "Each positional: $LINENO"


echo 2 | select name in OK BREAK REPEAT ; do : ; done

# incremented in each subshell
declare -i sh
sh=$BASH_SUBSHELL
(
    [[ $(( $sh + 1 )) == $BASH_SUBSHELL ]] || error $LINENO
    (
        [[ $(( $sh + 2 )) == $BASH_SUBSHELL ]] || error $LINENO
    )
)

# Process substitution
var=0
seq 5 | while read i ; do
    echo $i >/dev/null
    ((var++))
done
[[ $var == 0 ]] || error "pipe executed in the subshell: $LINENO"


var=0
for i in $(seq 8) ; do
    echo $i >/dev/null
    ((var++))
done
[[ $var == 8 ]] || error "$LINENO"


# this would break proc subst
# set -o posix
var=0
while read i ; do
    echo >/dev/null
    ((var++))
done < <(seq 10)
[[ $var == 10 ]] || error "$LINENO"

###############################################################################
# loops
###############################################################################
declare -i intval=0
declare -i iterations=5
for (( i=0; i<$iterations; i++ )) ; do
    (( intval++ ))
done
[[ $intval == $iterations ]] || error $LINENO
###############################################################################

# trick to pass var 'by reference':
echo_var() {
    for i in $@ ; do
        echo -n "$i=${!i};"
    done
}
x=1
y=2
[[ "x=1;y=2;" == $(echo_var x y) ]] || error $LINENO

change_any_var() {
    eval $1=$2
}
x=initial
change_any_var x changed
[[ $x == changed ]] || error $LINENO

# swaps to variables without tmp value:
function swap() {
    eval "$1=${!2} $2=${!1}"
}
x=1
y=2
swap x y 
[[ $x==2 && $y==1 ]] || error $LINENO


# pass multiple arrays as parameters to function
function echo_multiple_arrays() {
    declare -a first=("${!1}")
    declare -a second=("${!2}")
    echo "${second[@]} : ${first[@]}"
}
n=(1 2)
m=(a b c)
[[ "a b c : 1 2" == $(echo_multiple_arrays n[@] m[@]) ]] || error $LINENO

###############################################################################
# concatenate predefined strings
###############################################################################
f_concat() {
    cat | sed -e 's/^ *//' | paste -sd ':' -
}
x=$(f_concat<<EOF
    hello
    world
EOF
)
[[ "hello:world" == $x ]] || error $LINENO

###############################################################################
# indexed arrays
###############################################################################
function echo_array() {
    echo "\$@ = $@"
    arr=("$@")
    for i in "${arr[@]}" ; do
        echo "$i"
    done
}
# declare indexed array:
declare -a names
names+=(a)
names+=(b)
names+=(c)
# declare and assign indexed array:
fruits=('apple' 'peach')
#echo_array ${names[@]}
#echo_array ${fruits[@]}
# concateneate 2 arrays
joined=("${names[@]}" "${fruits[@]}")
[[ "a b c apple peach" == ${joined[@]} ]] || error $LINENO

#pushd /tmp
#echo ${DIRSTACK[@]}
# /tmp ~/ora/spacewalk
#popd

(
    echo one
    echo two
) > /dev/null

export singleline="this:\
is:\
singleline"

echo ">${singleline}<"

