#http://glandium.org/blog/?p=170
 
_bold=$(tput bold)
_normal=$(tput sgr0)
 
function readlink() {
    DIR=$1; 
    (cd "$DIR" && echo "$(pwd -P)")
}
 
 
___vcs_dir() {
  local vcs base_dir sub_dir ref
  sub_dir() {
    local sub_dir
    sub_dir=$(readlink "${PWD}")
    sub_dir=${sub_dir#$1}
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
    #echo $color
    return 0
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
    color=$(echo "Green")
  }
 
 
 
    hg_dir() {
        base_dir="."
        while [ ! -d "$base_dir/.hg" ]; do base_dir="$base_dir/.."; [ $(readlink "${base_dir}") = "/" ] && return 1; done
        base_dir=$(readlink "$base_dir")
        sub_dir=$(sub_dir "${base_dir}")
        ref=$(hg prompt "{branch}") #$(< "${base_dir}/.hg/branch")
        vcs="hg"
        # which is faster?
        #color=$(hg summary | grep -q '(clean)' && echo "Green" || echo "Red")
        color=Green #$([ "$(hg diff)" == "" ] && echo "Green" || echo "Red")
        #color=$([ "$(hg prompt "{status}")" == "!" ] && echo "Red" || echo "Green")
    }
 
 
    if [ -d ".hg" ]; 
    then
        if [ -d ".git" ];
        then
            svn_dir ||
            git_dir ||
            hg_dir ||
            base_dir="$PWD"
        else
            svn_dir ||
            hg_dir ||
            git_dir ||
            base_dir="$PWD"
        fi
    else
        svn_dir ||
        hg_dir ||
        git_dir ||
        base_dir="$PWD"
    fi
 
    if [ "$vcs" != "" ];
    then 
        # alternative approach
        #color1=\$$color
        #color2=`eval echo $color1`
        color2=${!color}
        export __vcs_color=$color2
        export __vcs_branch=" $ref"
    else
        export __vcs_color=""
        export __vcs_branch=""
    fi
 
}
 
export PROMPT_COMMAND='echo -ne "\033]0; ${host_short} `basename $PWD`\007"; history -a; ___vcs_dir'
export PS1="\`echo -e \"\[${Cyan}\]$host_short \[${Yellow}\]\w\[${Green}\]\[\$__vcs_color\]\$__vcs_branch\[${Yellow}\]\\$ \[${txtrst}\]\"\`"
