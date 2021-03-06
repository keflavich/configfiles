# .bashrc



# User specific aliases and functions
#PATH=/sw/bin:$PATH:/scisoft/bin:/scisoft/i386/bin:/sw/bin:/opt/local/bin
#PATH=/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/sw/bin:/opt/local/bin:/scisoft/bin:/scisoft/i386/bin:/Developer/usr/bin/:/star/bin
PATH=/usr/local/bin:/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Developer/usr/bin/:/star/bin:/Users/adam/bin/:$PATH
PATH=$PATH:/Library/Frameworks/GLib.framework/Resources/dev/bin/
PATH=$PATH:/Applications//exelis/idl82/bin/:/usr/local/itt/idl/idl81/bin/
PATH=$PATH:/usr/stsci/wcstools-3.7.3/bin.macintel/
PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin/:$PATH
PATH=$PATH:/usr/texbin/
PATH=$PATH:/usr/stsci/wcstools-3.7.3/bin.macintel/
PATH=$PATH:/Users/adam/repos/apache-maven-3.0.4/bin
PATH=/Users/adam/virtual-python/bin:$PATH:/usr/local/astrometry/bin/:/usr/local/netpbm/bin/
PATH=$PATH:/Developer-4.2/usr/bin/

# Needed for netpbm
export DYLD_LIBRARY_PATH=/usr/local/netpbm/lib/

#PATH=$PATH:/sw/bin:/opt/local/bin:/opt/local/xpa/bin/:
export PATH
#/scisoft/bin/Setup.bash
#xset b off
HISTSIZE=50000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTSIZE
#filt_dir=/home/adam/work/FILTERs_new
#export filt_dir
#alias ls="ls --color=auto"
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
alias universal='export CFLAGS="-arch i386 -arch x86_64"; export CCFLAGS="-arch i386 -arch x86_64"; export CXXFLAGS="-arch i386 -arch x86_64";'
alias x86_64='export CFLAGS="-arch x86_64"; export CCFLAGS="-arch x86_64"; export CXXFLAGS="-arch x86_64"; FFLAGS="-arch x86_64"; LDFLAGS="-arch x86_64"'
alias i386='export CFLAGS="-arch i386"; export CCFLAGS="-arch i386"; export CXXFLAGS="-arch i386"; FFLAGS="-arch i386"; LDFLAGS="-arch i386"'
alias clearflags='export CFLAGS=""; export CCFLAGS=""; export CXXFLAGS=""; export LDFLAGS=""; export FFLAGS="";'

alias nbconvert="/Users/adam/repos/nbconvert/nbconvert.py"

alias scp='rsync -Cavpu --partial --progress --rsh=ssh'
#alias svn='/sw/bin/svn'
alias HPC="export PATH=/Users/adam/Downloads/usr/local/bin:$PATH"
alias cloudy="/opt/cloudy/cloudy.exe"
alias idl="/Applications/itt/idl706/bin/idl ~/.idl/idlrc /Users/adam/work/bolocam/.idl_startup_bgps.pro"
alias idl="/Applications/exelis/idl/bin/idl ~/.idl/idlrc /Users/adam/work/bolocam/.idl_startup_bgps.pro"
alias bgpsv1="/Applications/itt/idl706/bin/idl ~/.idl/idlrc /Users/adam/work/bolocam/.idl_startup_bgpsv1.pro"
alias idl_bolo="/Applications/itt/idl706/bin/idl /Users/adam/work/bolocam/bolocam_svn/environment/bolocam_startup.pro"
alias aoidl='/Applications/itt/idl706/bin/idl ~/.aoidl' # must be IDL 7, I think
alias gbtidl="/Users/adam/repos/gbtidl/gbtidl"
alias macvim="/Applications/Vim.app/Contents/MacOS/Vim -g"
alias gvim="/Applications/Vim.app/Contents/MacOS/Vim -g"
alias f77="gfortran"
alias fv="/Applications/fv.app/Contents/MacOS/fv"
alias ls="ls -G"
alias casjobs="java -jar /Users/adam/DU_work/casjobs/casjobs.jar"
alias spectool='/Applications/itt/idl70/bin/idl /Users/adam/observations/triplespec/.idl_startup_tspec' 
#alias pylab="ipython -pylab -log"
#alias pylab32='/sw/bin/ipython -log -q4thread -i -c '\''from pylab import *;import numpy,scipy,matplotlib;'\'''
alias pylab='ipython -log -i -c '\''from pylab import *;import numpy,scipy,matplotlib,pyfits;'\'''
alias pylab='ipython --logappend ipython_`date +"%Y%m%d"`.py -i --c='\''from pylab import *;import numpy,scipy,matplotlib,pyfits;'\'''
alias pyphys='ipython -logfile pyphys.log -p physics -pylab'
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
alias scp='rsync -avp --progress'
alias pngtoeps='/Users/adam/agpy/contributed/pngtoeps'
alias ssh_gb='ssh -XY aginsbur@ssh.gb.nrao.edu'
alias ssh_newton='ssh -XY cuobserver@newton.apo.nmsu.edu'
alias ssh_aws="ssh -i ec2keypair.pem ubuntu@107.22.222.121"
scp_aws () { rsync -Cavpu --partial --progress --rsh="ssh -i ec2keypair.pem" "$1" ubuntu@107.22.222.121:$2; } 

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
alias pyraf='/Users/adam/.bin/pyraf.csh'

alias smart='/Users/adam/.idl/smart/smart'
export IDL_DIR='/Applications/itt/idl70/'
export IDL_DIR='/Applications//exelis/idl82/'
export IDL_PATH='/Users/adam/.idl/smart:/Users/adam/.idl/IRS_Calibration:/Applications/itt/idl70/lib/:/Applications/itt/idl70/lib/astron/:/Users/adam/observations/triplespec/Spextool2/pro/:'$IDL_PATH

shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

# "friendly" colors https://wiki.archlinux.org/index.php/Color_Bash_Prompt
. ~/.colors

# instead, just use macbook #host_short=`echo $HOSTNAME | sed 's/\([-a-z_]*\).*/\1/'`
host_short="macbook"
#PROMPT_COMMAND='echo -ne "\033]0; $host_short ${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND='echo -ne "\033]0; $host_short ${PWD/#$HOME/~}\007"; history -a'
# could use \h instead of the variable to automatically get hostname
export PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w\\$ \[${txtrst}\]"

#. /usr/stsci/envconfig.mac/cshrc
export AUTOSSH_PORT=20000

#. /sw/etc/bash_completion

set -o ignoreeof

# GILDAS - includes class
#export GAG_ROOT_DIR=/Users/adam/Downloads/gildas-exe-jul09a
#export GAG_EXEC_SYSTEM=pc-darwin-g95
#source $GAG_ROOT_DIR/etc/bash_profile


# export DISPLAY=":0.0"



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


source ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


. /Users/adam/repos/docbook-xsl-1.76.1/.profile.incl

