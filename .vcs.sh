#http://glandium.org/blog/?p=170

_bold=$(tput bold)
_normal=$(tput sgr0)

function readlink() {
    DIR=$1; #$(echo "${1%/*}")
    (cd "$DIR" && echo "$(pwd -P)")
}


___vcs_dir() {
  local vcs base_dir sub_dir ref
  sub_dir() {
    local sub_dir
    sub_dir=$(readlink "${PWD}")
    sub_dir=${sub_dir#$1}
    echo ${sub_dir#/}
  }


  git_dir() {
    base_dir=$(git rev-parse --show-cdup 2>/dev/null) || return 1
    base_dir=$(readlink "$base_dir")
    if [ "$base_dir" = `echo ~` ]; then base_dir=""; return 1; fi
    sub_dir=$(git rev-parse --show-prefix)
    sub_dir=${sub_dir%/}
    ref=$(git symbolic-ref -q HEAD || git name-rev --name-only HEAD 2>/dev/null)
    ref=${ref#refs/heads/}
    vcs="git"
    color=$(git diff-index --quiet HEAD 2>/dev/null && echo "Green" || echo "Red")
  }


  svn_dir() {
    [ -d ".svn" ] || return 1
    base_dir="."
    #while [ -d "$base_dir/.svn" ]; do base_dir="$base_dir/.."; done
    while [ ! -d "$base_dir/.svn" ]; do base_dir="$base_dir/.."; [ $(readlink "${base_dir}") = "/" ] && return 1; done
    base_dir=$(readlink "$base_dir")
    sub_dir=$(sub_dir "${base_dir}")
    ref=$(svn info "$base_dir" | awk '/^URL/ { sub(".*/","",$0); r=$0 } /^Revision/ { sub("[^0-9]*","",$0); print r":"$0 }')
    vcs="svn"
    color="Green"
  }



    hg_dir() {
        base_dir="."
        while [ ! -d "$base_dir/.hg" ]; do base_dir="$base_dir/.."; [ $(readlink "${base_dir}") = "/" ] && return 1; done
        base_dir=$(readlink "$base_dir")
        sub_dir=$(sub_dir "${base_dir}")
        ref=$(< "${base_dir}/.hg/branch")
        vcs="hg"
        color=$(hg summary | grep -q '(clean)' && echo "Green" || echo "Red")
    }


    svn_dir ||
    hg_dir ||
    git_dir ||
    base_dir="$PWD"

    if [ "$vcs" != "" ];
    then 
        color1=\$$color
        color2=`eval echo $color1`
        export __vcs_color=$color2
        export __vcs_branch=" $ref"
    else
        export __vcs_color=""
        export __vcs_branch=""
    fi

}

