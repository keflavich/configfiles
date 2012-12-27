#http://glandium.org/blog/?p=170

_bold=$(tput bold)
_normal=$(tput sgr0)

function readlink() {
  DIR=$(echo "${1%/*}")
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
    base_dir=$(readlink "$base_dir/..")
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
    while [ -d "$base_dir/../.svn" ]; do base_dir="$base_dir/.."; done
    base_dir=$(readlink "$base_dir")
    sub_dir=$(sub_dir "${base_dir}")
    ref=$(svn info "$base_dir" | awk '/^URL/ { sub(".*/","",$0); r=$0 } /^Revision/ { sub("[^0-9]*","",$0); print r":"$0 }')
    vcs="svn"
    color=""
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


    hg_dir ||
    git_dir ||
    svn_dir ||
    base_dir="$PWD"


    #echo "${vcs:+($vcs)}${_bold}${base_dir/$HOME/~}${_normal}${vcs:+[$ref]${_bold}${sub_dir}${_normal}}"
    #echo ":${vcs}:${ref}"
    if [ "$vcs" != "" ];
    then 
        color1=`echo $color`
        thing="\${$color1}:$ref"
        blah=`echo "$(echo $thing)"`
        #echo $blah
        echo ":$ref"
    else
        echo ""
    fi

    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:$(___vcs_dir)\$ '
    #PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w"'$(___vcs_dir)'"\\$ \[${txtrst}\]"
    #PS1=${PS1//\$(___vcs_dir)/$color:$ref}"

}


#__vcs_info() {
#   #echo "DEBUG $?"
#   #echo "$? -eq 0 -a $(git rev-parse --show-toplevel 2>/dev/null || echo \"/Users/adam\") != \"/Users/adam\""
#   git branch &>/dev/null 2>&1
#   if [ $? -eq 0 -a "$(git rev-parse --show-toplevel 2>/dev/null || echo "/Users/adam")" != "/Users/adam" -a "$(git rev-parse --show-toplevel 2>/dev/null || echo "/Users/adam")" != "" ];
#   then  
#       #echo "GIT PASSED"
#       git status 2>&1 | grep -E "nothing (added )?to commit" > /dev/null 2>&1;
#       if [ "$?" -eq "0" ]; then 
#           __vcs_branch=":\[\e[0;32m\]$(git branch | grep ^*|sed s/\*\ //)\[\e[0;33m\]"; 
#       else 
#           __vcs_branch=":\[\e[0;31m\]$(git branch | grep ^*|sed s/\*\ //)\[\e[0;33m\]"; 
#       fi
#   else
#       hg branch &> /dev/null 2>&1 
#       if [ $? -eq 0 ];
#       then
#           hg id | grep -E "+" > /dev/null 2>&1
#           if [ "$?" -eq "0" ];
#           then
#               __vcs_branch=":\[\e[0;32m\]$(hg branch)\[\e[0;33m\]";
#           else
#               __vcs_branch=":\[\e[0;31m\]$(hg branch)\[\e[0;33m\]";
#           fi
#       else
#           __vcs_branch="\[\]";
#       fi
#   fi
#   echo -e $__vcs_branch
#   }
# http://glandium.org/blog/?p=170
