# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac



# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# old versions...
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




# User specific aliases and functions
#PATH=/sw/bin:$PATH:/scisoft/bin:/scisoft/i386/bin:/sw/bin:/opt/local/bin
#PATH=/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/sw/bin:/opt/local/bin:/scisoft/bin:/scisoft/i386/bin:/Developer/usr/bin/:/star/bin
PATH=/home/adam/bin/ccache:/usr/local/bin:/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Developer/usr/bin/:/star/bin:/home/adam/bin/:$PATH
PATH=$PATH:/Library/Frameworks/GLib.framework/Resources/dev/bin/
PATH=$PATH:/Applications//exelis/idl82/bin/:/usr/local/itt/idl/idl81/bin/
PATH=$PATH:/usr/stsci/wcstools-3.7.3/bin.macintel/
#PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin/:$PATH
PATH=$PATH:/usr/texbin/
PATH=$PATH:/usr/stsci/wcstools-3.7.3/bin.macintel/
PATH=$PATH:/home/adam/repos/apache-maven-3.0.4/bin
PATH=$PATH:/usr/local/astrometry/bin/:/usr/local/netpbm/bin/
PATH=$PATH:/Developer-4.2/usr/bin/
PATH=$PATH:~/.casa/bin/
PATH=$PATH:/home/adam/repos/esoreflex/bin/
PATH=$PATH:/home/adam/repos/gasgano/bin
PATH=$PATH:/opt/local/bin/ # this is where wget lives
PATH=$PATH:/usr/local/mysql/bin/
# May 19, 2014: finally gave up on my custom-installed python.  gcc-4.2 is
# apparently incompatible with ccache, and I can't wait for astropy to build
# any more
#PATH=/Users/adam/virtual-python/bin:$PATH:/Users/adam/anaconda/bin/
#PATH=/Users/adam/anaconda/envs/astropy27/bin:$PATH:/Users/adam/anaconda/bin/
#PATH=/Users/adam/anaconda/envs/astropy35/bin:$PATH:/Users/adam/anaconda/bin/
PATH=/home/adam/anaconda3/bin:$PATH
# required for python extension builds, apparently?
#export CC=/usr/bin/gcc CPP=/usr/bin/cpp
#export CC=/usr/local/bin/gcc CPP=/usr/local/bin/cpp




# July 6, 2019: disable DYLD paths entirely

# Needed for netpbm
#export DYLD_LIBRARY_PATH=/usr/local/netpbm/lib/
#export NETPBM_INC="-I/usr/local/netpbm/include/"
#export NETPBM_LIB="-L/usr/local/netpbm/lib -lnetpbm"
# Oct 6, 2013: needed for PyMultiNest
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
# Feb 22, 2017: gsl needed for Krumholz codes: despotic, slug2
#export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/home/adam/repos/MultiNest/lib:/Users/adam/anaconda/pkgs/gsl-2.2.1-0/lib/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/X11/lib/

#PATH=$PATH:/sw/bin:/opt/local/bin:/opt/local/xpa/bin/:
export PATH
#/scisoft/bin/Setup.bash
#xset b off
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTSIZE=500000
export HISTFILESIZE=500000
#filt_dir=/home/adam/work/FILTERs_new
#export filt_dir
#PGPLOT_DIR="/usr/local/pgplot/"; export PGPLOT_DIR
#LD_LIBRARY_PATH="/usr/local/pgplot"; export LD_LIBARY_PATH
#export IRAFARCH=redhat
#export IRAF=/scisoft/share/iraf/iraf/
#. /scisoft/all/bin/Setup.bash

export SVN_EDITOR=vim
export TEXINPUTS=".:~/papers/latexfiles/:"

#export XDG_DATA_DIRS=/opt/local/share
#export XDG_DATA_HOME=/opt/local/share
#export XDG_CONFIG_DIRS=/opt/local/etc/xdg

export PYTHONSTARTUP=~/.pythonrc

export STARLINK_DIR=/star
#. /star/etc/profile
alias random10="python -c 'import random, string;print(\"\".join(random.sample(string.ascii_letters+string.digits, 10)))'"
alias random20="python -c 'import random, string;print(\"\".join(random.sample(string.ascii_letters+string.digits, 20)))'"
alias pwgen=random20
alias universal='export CFLAGS="-arch i386 -arch x86_64"; export CCFLAGS="-arch i386 -arch x86_64"; export CXXFLAGS="-arch i386 -arch x86_64";'
alias x86_64='export CFLAGS="-arch x86_64"; export CCFLAGS="-arch x86_64"; export CXXFLAGS="-arch x86_64"; FFLAGS="-arch x86_64"; LDFLAGS="-arch x86_64"'
alias i386='export CFLAGS="-arch i386"; export CCFLAGS="-arch i386"; export CXXFLAGS="-arch i386"; FFLAGS="-arch i386"; LDFLAGS="-arch i386"'
alias clearflags='export CFLAGS=""; export CCFLAGS=""; export CXXFLAGS=""; export LDFLAGS=""; export FFLAGS="";'

#alias nbconvert="/home/adam/repos/nbconvert/nbconvert.py"
#alias nbconvert="~/virtual-ipydev/bin/ipython nbconvert"

alias scp='rsync -avp --progress'
alias scp='rsync -Cavpu --partial --progress --rsh=ssh'
#alias svn='/sw/bin/svn'
alias HPC="export PATH=/home/adam/Downloads/usr/local/bin:$PATH"
alias idlde='/Applications/exelis/idl/bin/idlde ~/.idl/idlrc'
alias radmc_idl='/Applications/exelis/idl/bin/idl ~/.idl/radmc_startup'
alias aoidl='/Applications/exelis/idl/bin/idl ~/.aoidl' # must be IDL 7, I think.  DONT AHVE !!!!!!! AUGH!?!?! (June 20143)
alias macvim="/Applications/Vim.app/Contents/MacOS/Vim -g"
alias f77="gfortran"
alias fv="/Applications/fv.app/Contents/MacOS/fv"
#alias ls="ls -Ghp"
## 4/30/2014: http://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output
#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# GNU ls:
#alias ls="ls --color=auto -hp"
#alias pylab="ipython -pylab -log"
#alias pylab32='/sw/bin/ipython -log -q4thread -i -c '\''from pylab import *;import numpy,scipy,matplotlib;'\'''
alias pylab='ipython -log -i -c '\''import numpy,scipy,matplotlib;'\'''
alias pylab='ipython --logappend ipython_`date +"%Y%m%d"`.py --profile=pyplot --matplotlib -i'
alias pyphys='ipython -logfile pyphys.log -p physics --matplotilb'
alias astropy='ipython --profile=astropy -i'
alias astropylab='ipython --profile=astropylab --matplotlib -i'
alias astropylab35='~/anaconda/envs/astropy35/bin/ipython --profile=astropylab --matplotlib -i'
alias astropylab27='~/anaconda/envs/astropy27/bin/ipython --profile=astropylab --matplotlib -i'
#alias pelican-themes='/Users/adam/anaconda/envs/astropy27/bin/pelican-themes'
#alias pelican='/Users/adam/anaconda/envs/astropy27/bin/pelican'
alias ipynb='jupyter notebook'
alias ipynb35='~/anaconda/envs/astropy35/bin/ipython notebook'
alias ipynb27='~/anaconda/envs/astropy27/bin/ipython notebook'
alias despotic_gui='ipython -i --c="import despotic; despotic.run_cloud_gui()"'
alias ssh_milkyway='/usr/bin/ssh -XY ginsbura@milkyway.colorado.edu'
alias ssh_origins2='/usr/bin/ssh -XY ginsbura@origins2.colorado.edu'
alias ssh_calculon='/usr/bin/ssh -XY ginsbura@calculon.colorado.edu'
alias ssh_milkyway_noX='/usr/bin/ssh ginsbura@milkyway.colorado.edu'
alias ssh_origins_noX='/usr/bin/ssh ginsbura@origins.colorado.edu'
alias ssh_origins='/usr/bin/ssh -XY ginsbura@origins2.colorado.edu'
alias ssh_trapezium='/usr/bin/ssh -XY ginsbura@trapezium.colorado.edu'
alias ssh_solo='/usr/bin/ssh -XY ginsbura@solo.colorado.edu'
alias ssh_cosmos='/usr/bin/ssh -XY ginsbura@cosmos.colorado.edu'
alias ssh_scorpius='/usr/bin/ssh -XY ginsbura@scorpius.colorado.edu'
alias ssh_eta='/usr/bin/ssh -XY adam@eta.colorado.edu'
alias ssh_arlsrv2='/usr/bin/ssh -X ginsbura@arlsrv2.colorado.edu'
alias python64='/Library/Frameworks/Python.framework/Versions/2.6/bin/python-64'
alias epd_python='/Library/Frameworks/EPD64.framework/Versions/7.2/bin/python'
alias epd_ipython='/Library/Frameworks/EPD64.framework/Versions/7.2/bin/ipython'
alias ssh_kilauea='/usr/bin/ssh -XY bolocam@kilauea.caltech.edu'
alias ssh_sharc='/usr/bin/ssh -XY sharc@kilauea.caltech.edu'
alias pngtoeps='/Users/adam/agpy/contributed/pngtoeps'
alias ssh_gb='ssh -XY aginsbur@ssh.gb.nrao.edu'
alias ssh_newton='ssh -XY cuobserver@newton.apo.nmsu.edu'
alias ssh_aws="ssh -i ec2keypair.pem ubuntu@107.22.222.121"
alias skim='open -a /Applications/Skim.app'
#alias adsbibdesk='/Users/adam/anaconda/envs/astropy27/bin/adsbibdesk'
#alias adsbibdesk='/Users/adam/anaconda/envs/astropy35/bin/adsbibdesk'
alias scp_shamash_hoops='rsync -Capu --partial --progress --rsh=ssh -e "ssh -A aginsbur@ssh.eso.org ssh -A aginsbur@orion.hq.eso.org ssh -A -o StrictHostKeyChecking=no ginsburg@hera.ph1.uni-koeln.de ssh -o StrictHostKeyChecking=no -A"'
scp_aws () { rsync -Cavpu --partial --progress --rsh="ssh -i ec2keypair.pem" "$1" ubuntu@107.22.222.121:$2; } 
alias gnutar="DYLD_LIBRARY_PATH=/Users/adam/anaconda/lib /usr/local/bin/gnutar"

newton=cuobserver@newton.apo.nmsu.edu
origins=ginsbura@origins.colorado.edu
opub=ginsbura@origins2.colorado.edu:./public_html/
#o3510=ginsbura@origins.colorado.edu:~bally/public_html/ASTR3510/public/
o3510=ginsbura@cosmos.colorado.edu:/usr/local/adm/config/apache/htdocs/astr3510/
ocomps=ginsbura@origins.colorado.edu:./public_html/comps/
milkyway=ginsbura@milkyway.colorado.edu
origins2=ginsbura@origins2.colorado.edu
calculon=ginsbura@calculon.colorado.edu
mpub=ginsbura@milkyway.colorado.edu:/home/milkyway/student/ginsbura/bgps_pipeline/
cosmos=ginsbura@cosmos.colorado.edu
solo=ginsbura@solo.colorado.edu
v7=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v0.7/
arlsrv2=ginsbura@arlsrv2.colorado.edu
v1=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v1.0/
v12mw=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v1.0/v1.0.2/
v12=eta.colorado.edu:/Volumes/disk2/data/bgps/releases/v1.0/v1.0.2/
v11mw=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v1.1/
v11=eta.colorado.edu:/Volumes/disk2/data/bgps/releases/v1.1/
v2=eta.colorado.edu:/Volumes/disk2/data/bgps/releases/v2.0/
v12=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v1.0/v1.0.2/
svnpath=svn+ssh://ginsbura@milkyway.colorado.edu//home/milkyway/student/ginsbura/svn/
papersvn=file:///Users/adam/papers/svn/ 
etapapersvn=svn+ssh://adam@eta.colorado.edu//Users/adam/papers/svn/ 
irassvn=svn+ssh://adam@eta.colorado.edu//Users/adam/work/IRAS05358/svn/
propsvn=svn+ssh://adam@eta.colorado.edu//Users/adam/proposals/svn/
eta=adam@eta.colorado.edu
agpysvn=https://agpy.googlecode.com/svn/trunk/
kilauea=bolocam@kilauea.caltech.edu
sharc=sharc@kilauea.caltech.edu
gb=aginsbur@ssh.gb.nrao.edu
alias ssh_arecibo='/usr/bin/ssh -X aginsbur@remoto.naic.edu'
arecibo=aginsbur@remoto.naic.edu

# unfortunately the new STSCI pyraf install requires csh
# this ameliorates the problem


# moved to 'universal' shopt -s histappend
# moved to 'universal' shopt -s hostcomplete
# moved to 'universal' shopt -s nocaseglob
# append to the history file, don't overwrite it
#shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize


# load git completion tools!  http://clalance.blogspot.com/2011/10/git-bash-prompts-and-tab-completion.html
# source /Users/adam/repos/git-1.7.6/contrib/completion/git-completion.bash
# Done once:
# git config --global alias.unstage 'reset --'

# load "global" parameters here
. ~/.bashrc_universal

# "friendly" colors https://wiki.archlinux.org/index.php/Color_Bash_Prompt
. ~/.colors

# instead, just use macbook #host_short=`echo $HOSTNAME | sed 's/\([-a-z_]*\).*/\1/'`
host_short="alien"
#PROMPT_COMMAND='echo -ne "\033]0; $host_short ${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND='echo -ne "\033]0; $host_short ${PWD/#$HOME/~}\007"; '
export PROMPT_COMMAND='history -a; ___vcs_dir'
# could use \h instead of the variable to automatically get hostname
export PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w\\$ \[${txtrst}\]"
. ~/.vcs.sh
export PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w\[${Green}\]"'$(___vcs_dir)'"\[${Yellow}\]\\$ \[${txtrst}\]"
export PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w\[${Green}\]\$(___vcs_dir)\[${Yellow}\]\\$ \[${txtrst}\]"
export PS1="\`echo -e \"\[${Cyan}\]$host_short \[${Yellow}\]\w\[${Green}\]\[\$__vcs_color\]\$__vcs_branch\[${Yellow}\]\\$ \[${txtrst}\]\"\`"


#. /usr/stsci/envconfig.mac/cshrc
export AUTOSSH_PORT=20000

#. /sw/etc/bash_completion

# moved to universal set -o ignoreeof

# GILDAS - includes class
#export GAG_ROOT_DIR=/Users/adam/Downloads/gildas-exe-jul09a
#export GAG_EXEC_SYSTEM=pc-darwin-g95
#source $GAG_ROOT_DIR/etc/bash_profile


# export DISPLAY=":0.0"


# moved to universal export LANG=en_US.UTF-8
# moved to universal export LC_CTYPE=en_US.UTF-8

# stupid Mac Terminal hack (http://pseudogreen.org/blog/set_tab_names_in_leopard_terminal.html)
# function set_window_and_tab_title
# {
#     local title="$1"
#     if [[ -z "$title" ]]; then
#         title="root"
#     fi
# 
#     local tmpdir=~/Library/Caches/${FUNCNAME}_temp
#     local cmdfile="$tmpdir/$title"
# 
#     # Set window title
#     echo -n -e "\e]0;${title}\a"
# 
#     # Set tab title
#     if [[ -n ${CURRENT_TAB_TITLE_PID:+1} ]]; then
#         kill $CURRENT_TAB_TITLE_PID
#     fi
#     mkdir -p $tmpdir
#     ln /bin/sleep "$cmdfile"
#     "$cmdfile" 10 &
#     CURRENT_TAB_TITLE_PID=$(jobs -x echo %+)
#     disown %+
#     kill -STOP $CURRENT_TAB_TITLE_PID
#     command rm -f "$cmdfile"
# }
# 
# PROMPT_COMMAND='set_window_and_tab_title "$host_short ${PWD##*/}"'


#source ~/.rvm/scripts/rvm
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting



# qhull installed 11/11/2013
# required hacking the makefile to not include -Wno-sign-somethingorother
# because that was for gcc-4.4 and I am using gcc-4.2
# because artist is stupid, I had to link /usr/local/include/libqhull to /usr/local/include/qhull
export LIBDIR_QHULL=/usr/local/lib
export INCLUDEDIR_QHULL=/usr/local/include/libqhull


# 11/12/2013: add RADEX_DATAPATH
export RADEX_DATAPATH=~/LAMDA/

# Bloody hell... MAVERICKS!!!
# https://groups.google.com/a/continuum.io/forum/#!msg/anaconda/kvWVtW40aDI/cr9IkGdyzY4J
defaults write org.python.python NSAppSleepDisabled -bool YES 
defaults write com.apple.Finder NSAppSleepDisabled -bool YES

alias wtf='say "What the F?"'
alias enhance='say "enhance"'

export GIT_CEILING_DIRECTORIES='/home/adam/'

# http://stackoverflow.com/questions/8766730/tar-command-in-mac-os-x-adding-hidden-files-why
export COPYFILE_DISABLE=true

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Cloudy:
export CLOUDY_DATA_PATH=~/repos/c13.02/data/
#export PATH=$PATH:/Users/adam/repos/c13.02/source


# RATRAN:
#export RATRAN=/Users/adam/repos/ratran
#export RATRANRUN=/Users/adam/repos/ratran/run
export CFITSIO=/usr/local/lib


# The next line updates PATH for the Google Cloud SDK.
#export PATH=$PATH:/Users/adam/google-cloud-sdk/bin/

# The next line enables shell command completion for gcloud.
# source '/Users/adam/google-cloud-sdk/completion.bash.inc'

# to solve this issue:
# $ gdb
# dyld: Library not loaded: @rpath/libpython3.5m.dylib
#   Referenced from: /usr/local/bin/gdb
#   Reason: image not found
# Trace/BPT trap: 5
# see comments below http://ntraft.com/installing-gdb-on-os-x-mavericks/

# July 6, 2019: removed this to avoid library path problems
# added the local / lib paths to solve a shapely.geom issue: https://github.com/kjordahl/SciPy2013#installation-instructions
#export DYLD_FALLBACK_LIBRARY_PATH="/Users/adam/anaconda/envs/astropy35/lib/:/usr/local/lib:/lib:/usr/lib"

# https://askubuntu.com/questions/567813/automake-does-not-find-pkg-config-macros
export AL_OPTS=/usr/local/share/aclocal

# to make gnu-tar work (worried this might cause problems though)
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/adam/anaconda/lib
# (yes, it breaks everything else)
#
export ASTROMETRY_NET_API_KEY="ylqlshinbzlbuvue"

# mac os 10.14 mojave fixes
#export LIBRARY_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/lib:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/:/Library/Developer/CommandLineTools/usr/lib/
#export C_INCLUDE_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/include:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/:/Library/Developer/CommandLineTools/usr/include/
# above lines removed soon after
# the fix process was:
# (1) download a very specific version of xcode cmdline tools: "/Users/adam/Downloads/Command_Line_Tools_macOS_10.14_for_Xcode_10.2.1.dmg"
# (2) Install those
# (3) install the SDK headers package that didn't exist until you completed (2), i.e.:  /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
export PATH=$PATH:~/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/adam/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/adam/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/adam/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/adam/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# WSL junk
alias powershell=/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe
alias open="powershell /c start"



export PATH=$PATH:/home/adam/casa-release-5.7.0-134.el7/bin/


# XCLASS: Added July 28, 2021
export XCLASSRootDir=/mnt/d/xclass/XCLASS-Interface/
export PATH=$PATH:$XCLASSRootDir/programs/XCLASSViewer/
export PATH=$PATH:$XCLASSRootDir/programs/XCLASSGUI/
# - To avoid a segmentation fault error message, please unlimit the stack and
#   increase the OpenMP stack size by adding the following lines to your .bashrc:

#ulimit -s unlimited
#export KMP_STACKSIZE='4999M'
#export OMP_STACKSIZE='4999M'
#export GOMP_STACKSIZE='4999M'


# activate anaconda python
source activate python3.9


sshl () {
    xhost=$1;
    ssh -L 23456:$xhost.ufhpc:23456 -L 35537:$xhost.ufhpc:35537 -D 8123 hpg
}

sshx () {
    xhost=$1;
    [[ $2 ]] && port=$2 || port=2222
    ssh -N -f -C -L $port:$xhost:22 hpg
    ssh -Yp $port adamginsburg@localhost
}

. ~/.gh_token
