# .bashrc

# avoid process limits: https://discussions.apple.com/message/13099346?messageID=13099346
ulimit -u 512


# User specific aliases and functions
#PATH=/sw/bin:$PATH:/scisoft/bin:/scisoft/i386/bin:/sw/bin:/opt/local/bin
#PATH=/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/sw/bin:/opt/local/bin:/scisoft/bin:/scisoft/i386/bin:/Developer/usr/bin/:/star/bin
OLDPATH=$PATH
# PATH=$PATH:/sw/bin:/opt/local/bin:/opt/local/sbin:/scisoft/i386/bin:/usr/local/sbin/GCALDaemon/bin/
# . /sw/bin/init.sh
# test -r /sw/bin/init.sh && . /sw/bin/init.sh
#PATH=/bin:/usr/bin:/usr/texbin:$PATH:/usr/X11/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/Developer/usr/bin/:/star/bin:/opt/local/xpa/bin/:/Users/adam/bin:/usr/local/bin:/opt/subversion/bin
#PATH=/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH
export PATH=/Users/adam/virtual-python/bin/:/Library/Frameworks/Python.framework/Versions/2.6/bin:/bin:/usr/bin:/usr/texbin:/usr/X11/bin:/Users/adam/bin
export PATH=$PATH:/usr/local/bin/montage:/usr/stsci/wcstools-3.7.3/bin.macintel/
export PATH=$PATH:/usr/local/cuda/bin:/Applications/itt/idl/idl/bin
export PATH=$PATH:/usr/local/git/bin:/usr/local/bin:/usr/local/apache2/bin:/usr/sbin:/sbin
#PATH=/sw/bin:$PATH
#export PATH
#/scisoft/bin/Setup.bash
#xset b off
export HISTSIZE=2000000
export HISTTIMEFORMAT="%d/%m/%y %T "
#filt_dir=/home/adam/work/FILTERs_new
#export filt_dir
#alias ls="ls --color=auto"
#PGPLOT_DIR="/usr/local/pgplot/"; export PGPLOT_DIR
#LD_LIBRARY_PATH="/usr/local/pgplot"; export LD_LIBARY_PATH
#LD_LIBRARY_PATH='/usr/X11/lib:/usr/X11R6/lib:'$LD_LIBRARY_PATH; export LD_LIBRARY_PATH
#export IRAFARCH=redhat
#export IRAF=/scisoft/share/iraf/iraf/
#. /scisoft/all/bin/Setup.bash

export TEXINPUTS=".:~/papers/latexfiles/:"

export XDG_DATA_DIRS=/opt/local/share
export XDG_DATA_HOME=/opt/local/share
export XDG_CONFIG_DIRS=/opt/local/etc/xdg

export PYTHONSTARTUP=~/.pythonrc
export PYTHONDONTWRITEBYTECODE=true
#export PYTHONPATH='/Users/adam/agpy'

export RATRANRUN=/Users/adam/repos/Ratran/run
export RATRAN=/Users/adam/repos/Ratran
export CFITSIO=/usr/local/lib

export SVN_EDITOR="vim --noplugin"

export STARLINK_DIR=/star
#. /star/etc/profile

#alias cloudy="/opt/cloudy/cloudy.exe"
#alias cloudy="/Users/adam/repos/cloudy_c10.0/source/cloudy.exe"
export CLOUDY_DATA_PATH='/Users/adam/repos/cloudy_c10.0/data'
alias ds9='/usr/local/bin/ds9'
. /Applications/itt/idl/idl81/bin/idl_setup.bash
#. /Applications/itt/idl706/bin/idl_setup.bash
export IDL_BIN='/Applications/itt/idl/idl/bin/idl'
alias idl="$IDL_BIN ~/.idl/idlrc /Users/adam/work/bolocam/.idl_startup_bgps.pro"
alias idl70="/Applications/itt/idl706/bin/idl ~/.idl/idlrc /Users/adam/work/bolocam/.idl_startup_bgps.pro"
alias bgpsv1="$IDL_BIN ~/.idl/idlrc /Users/adam/work/bolocam/.idl_startup_bgpsv1.pro"
alias idl_both="$IDL_BIN ~/.idl/idlrc /Users/adam/work/bolocam/.idl_startup_bgps.pro /Users/adam/work/bolocam/bolocam_svn/environment/bolocam_startup.pro"
alias idl_bolo="$IDL_BIN /Users/adam/work/bolocam/bolocam_svn/environment/bolocam_startup.pro"
alias macvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
alias gvim="/Applications/Vim.app/Contents/MacOS/Vim -g"
alias f77="gfortran"
alias fv="/Applications/fv.app/Contents/MacOS/fv"
alias ls="ls -G"
alias casjobs="java -jar /Users/adam/DU_work/casjobs/casjobs.jar"
alias spectool='/Applications/itt/idl70/bin/idl /Users/adam/observations/triplespec/.idl_startup_tspec'  # spextool
#alias pylab="ipython -pylab -log"
#alias pylab="ipython -log -i -pylab -c 'import numpy,scipy,matplotlib;'"
#alias pylab32="/sw/bin/ipython -log -q4thread -i -c 'from pylab import *;import numpy,scipy,matplotlib;'"
alias pylab="/Library/Frameworks/Python.framework/Versions/2.6/bin/ipython --pylab -i"
alias pyphys='ipython -logfile pyphys.log -p physics -pylab'
alias python='/Library/Frameworks/Python.framework/Versions/2.6/bin/python'
alias ipython64='/Library/Frameworks/Python.framework/Versions/2.6/bin/ipython'
alias python64='python-64'
alias iyt='/Library/Frameworks/Python.framework/Versions/2.5/bin/ipython -log'
alias ssh_milkyway='/usr/bin/ssh -X ginsbura@milkyway.colorado.edu'
alias ssh_origins2='/usr/bin/ssh -X ginsbura@origins2.colorado.edu'
alias ssh_calculon='/usr/bin/ssh -X ginsbura@calculon.colorado.edu'
alias ssh_milkyway_noX='/usr/bin/ssh ginsbura@milkyway.colorado.edu'
alias ssh_origins_noX='/usr/bin/ssh ginsbura@origins.colorado.edu'
alias ssh_origins='/usr/bin/ssh -X ginsbura@origins.colorado.edu'
alias ssh_ubc='/usr/bin/ssh -X adamgins@signals.ok.ubc.ca'
alias ssh_trapezium='/usr/bin/ssh -X ginsbura@trapezium.colorado.edu'
alias ssh_solo='/usr/bin/ssh -X ginsbura@solo.colorado.edu'
alias ssh_mira='/usr/bin/ssh -X ginsbura@mira.colorado.edu'
alias ssh_orion='/usr/bin/ssh -X ginsbura@orion.colorado.edu'
alias ssh_arlsrv2='/usr/bin/ssh -X ginsbura@arlsrv2.colorado.edu'
alias ssh_cosmos='/usr/bin/ssh -X ginsbura@cosmos.colorado.edu'
alias ssh_scorpius='/usr/bin/ssh -X ginsbura@scorpius.colorado.edu'
alias ssh_kilauea='/usr/bin/ssh -X bolocam@kilauea.caltech.edu'
alias ssh_nebula='/usr/bin/ssh -XY ginsbura@nebula3'
alias ssh_corvette='/usr/bin/ssh -X ginsburga@corvette'
#alias scp='rsync -Cavp --progress'
alias scp='rsync -Cavpu --partial --progress --rsh=ssh'
alias gbtidl=/Users/adam/observations/gbtidl/gbtidl
alias aoidl="/Applications/itt/idl706/bin/idl ~/.aoidl"
alias ssh_sharc='/usr/bin/ssh -X sharc@kilauea.caltech.edu'
sharc=sharc@kilauea.caltech.edu
alias ssh_gb='/usr/bin/ssh -X aginsbur@ssh.gb.nrao.edu'
alias ssh_arecibo='/usr/bin/ssh -X aginsbur@remoto.naic.edu'
alias ssh_hht='ssh -X obs@smtoast.as.arizona.edu'
alias md5sum="openssl md5"
# out of date alias ssh_aws='ssh -i ~/Sites/ec2keypair.pem ec2-user@ec2-50-17-134-102.compute-1.amazonaws.com'
alias ssh_aws='ssh -i ~/Sites/ec2keypair.pem ec2-user@107.22.222.121'
alias ssh_aws='ssh -i ec2keypair.pem ubuntu@107.22.222.121'
scp_aws () { rsync -Cavpu --partial --progress --rsh="ssh -i ec2keypair.pem" "$1" ubuntu@107.22.222.121:$2; }


# X-ray 
alias ciao=". /soft/ciao-4.1/bin/ciao.bash"
export HEADAS=/Users/adam/desktop/heasoft-6.6.2/i686-apple-darwin9.6.3
alias heainit=". $HEADAS/headas-init.sh"

origins=ginsbura@origins.colorado.edu
opub=ginsbura@origins2.colorado.edu:public_html/
#o3510=ginsbura@origins.colorado.edu:~bally/public_html/ASTR3510/public/
o3510=ginsbura@cosmos.colorado.edu:/usr/local/adm/config/apache/htdocs/astr3510/
ocomps=ginsbura@origins.colorado.edu:./public_html/comps/
milkyway=ginsbura@milkyway.colorado.edu
origins2=ginsbura@origins2.colorado.edu
calculon=ginsbura@calculon.colorado.edu
orion=ginsbura@orion.colorado.edu
mpub=ginsbura@milkyway.colorado.edu:/home/milkyway/student/ginsbura/bgps_pipeline/
solo=ginsbura@solo.colorado.edu
mira=ginsbura@mira.colorado.edu
arlsrv2=ginsbura@arlsrv2.colorado.edu
cosmos=ginsbura@cosmos.colorado.edu
v7=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v0.7/
v1=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v1.0/
v12mw=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v1.0/v1.0.2/
v12=/Volumes/disk2/data/bgps/releases/v1.0/v1.0.2/
v11mw=ginsbura@milkyway.colorado.edu:/data/bgps/releases/v1.1/
v11=/Volumes/disk2/data/bgps/releases/v1.1/
v2=/Volumes/disk2/data/bgps/releases/v2.0/
IPAC=/Volumes/disk2/data/bgps/releases/IPAC/map/
kilauea=bolocam@kilauea.caltech.edu
svnpath=svn+ssh://ginsbura@milkyway.colorado.edu//home/milkyway/student/ginsbura/svn/
papersvn=file:///Users/adam/papers/svn/ 
sitesvn=file:///Users/adam/svnwebsite/
irassvn=file:///Users/adam/work/IRAS05358/svn/
agpysvn=https://agpy.googlecode.com/svn/trunk/
data=/Volumes/disk2/data/
nebula=ginsbura@nebula2
ubc=adamgins@signals.ok.ubc.ca
gb=aginsbur@ssh.gb.nrao.edu
arecibo=aginsbur@remoto.naic.edu
hht=obs@smtoast.as.arizona.edu
export work=/Volumes/disk3/adam_work
export sliced=/Volumes/disk2/sliced/
export WDsliced=/Volumes/WD_1/sliced/
export WDinfiles=/Volumes/WD_1/sliced/INFILES/
export sliced_poly=/Volumes/disk2/sliced_polychrome/
export infiles=/Volumes/disk2/sliced/INFILES/
export infiles=/Users/adam/work/bgps_pipeline/mapping_lists/INFILES/
export ref_fields=/Volumes/disk2/ref_fields/
export pipeline=/Users/adam/work/bgps_pipeline
#alias universal='export CFLAGS="-arch ppc7400 -arch ppc64 -arch i386 -arch x86_64"; export CCFLAGS="-arch ppc7400 -arch ppc64 -arch i386 -arch x86_64"; export CXXFLAGS="-arch ppc7400 -arch ppc64 -arch i386 -arch x86_64"; export LDFLAGS="-arch ppc7400 -arch ppc64 -arch i386 -arch x86_64"'
alias universal='export CFLAGS="-arch i386 -arch x86_64"; export CCFLAGS="-arch i386 -arch x86_64"; export CXXFLAGS="-arch i386 -arch x86_64"; FFLAGS="-arch i386 -arch x86_64"; LDFLAGS="-arch i386 -arch x86_64"'
alias x86_64='export CFLAGS="-arch x86_64"; export CCFLAGS="-arch x86_64"; export CXXFLAGS="-arch x86_64"; FFLAGS="-arch x86_64"; LDFLAGS="-arch x86_64"'
alias i386='export CFLAGS="-arch i386"; export CCFLAGS="-arch i386"; export CXXFLAGS="-arch i386"; FFLAGS="-arch i386"; LDFLAGS="-arch i386"'
alias clearflags='export CFLAGS=""; export CCFLAGS=""; export CXXFLAGS=""; export LDFLAGS=""; export FFLAGS="";'

alias crush=/Users/adam/Downloads/crush-1.63/crush
alias epd-python=/Library/Frameworks/EPD64.framework/Versions/7.2/bin/python 
alias epd-ipython=/Library/Frameworks/EPD64.framework/Versions/7.2/bin/ipython 
epd_path=/Library/Frameworks/EPD64.framework/Versions/7.2/bin/

# unfortunately the new STSCI pyraf install requires csh
# this ameliorates the problem
alias pyraf='/Users/adam/.bin/pyraf.csh'

alias smart='/Users/adam/.idl/smart/smart'
# set in idl_setup.bash export IDL_DIR='/Applications/itt/idl706'
export IDL_PATH=/Users/adam/.idl/smart:/Users/adam/.idl/IRS_Calibration:/Applications/itt/idl706/lib/:/Applications/itt/idl706/lib/astron/:/Users/adam/observations/triplespec/Spextool2/pro/:$IDL_PATH

shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

# "friendly" colors https://wiki.archlinux.org/index.php/Color_Bash_Prompt
. ~/.colors

# instead, just use macbook #host_short=`echo $HOSTNAME | sed 's/\([-a-z_]*\).*/\1/'`
host_short="eta"
export PROMPT_COMMAND='echo -ne "\033]0; ${host_short} ${PWD/#$HOME/~}\007"; history -a'
# could use \h instead of the variable to automatically get hostname
export PS1="\[${Cyan}\]${host_short} \[${Yellow}\]\w\\$ \[${txtrst}\]"

#. /usr/stsci/envconfig.mac/cshrc
export AUTOSSH_PORT=20000

#. /sw/etc/bash_completion

set -o ignoreeof

# export DISPLAY=":0.0"
#


# GILDAS CLASS
# export GAG_ROOT_DIR=/Users/adam/Downloads/gildas-exe-jul09a
# export GAG_EXEC_SYSTEM=pc-darwin-g95
# source $GAG_ROOT_DIR/etc/bash_profile

alias gildas="export GAG_ROOT_DIR=/Users/adam/Downloads/gildas-exe-jul09a; export GAG_EXEC_SYSTEM=pc-darwin-g95; source /Users/adam/Downloads/gildas-exe-jul09a/etc/bash_profile"

# stupid Mac Terminal hack (http://pseudogreen.org/blog/set_tab_names_in_leopard_terminal.html)
function set_window_and_tab_title
{
    local title="$1"
    if [[ -z "$title" ]]; then
        title="root"
    fi

    local tmpdir=~/Library/Caches/${FUNCNAME}_temp
    local cmdfile="$tmpdir/$title"

    # Set window title
    #echo -n -e "\e]0;${title}\a"
    #echo -n -e "${title}\a"

    # Set tab title
    if [[ -n ${CURRENT_TAB_TITLE_PID:+1} ]]; then
        kill $CURRENT_TAB_TITLE_PID
    fi
    mkdir -p $tmpdir
    ln /bin/sleep "$cmdfile"
    "$cmdfile" 10 &
    CURRENT_TAB_TITLE_PID=$(jobs -x echo %+)
    disown %+
    kill -STOP $CURRENT_TAB_TITLE_PID
    command rm -f "$cmdfile"
}

#PROMPT_COMMAND='set_window_and_tab_title "$host_short ${PWD##*/}"'
#PROMPT_COMMAND='echo -n -e "${PWD##*/}\a"'

# rvm:
# install by curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting



#/usr/share/terminfo/78/xterm-256color
#http://vim.wikia.com/wiki/256_colors_in_vim
#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#    export TERM='xterm-256color'
#else
#    export TERM='xterm-color'
#fi
