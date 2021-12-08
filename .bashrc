set -o noclobber
set -o ignoreeof

shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTSIZE=500000


. ~/.colors

host_short=`hostname`
#PROMPT_COMMAND='echo -ne "\033]0; $host_short ${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND='echo -ne "\033]0; $host_short ${PWD/#$HOME/~}\007"; '
export PROMPT_COMMAND='history -a; ___vcs_dir'
# could use \h instead of the variable to automatically get hostname
export PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w\\$ \[${txtrst}\]"
. ~/.vcs.sh
export PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w\[${Green}\]"'$(___vcs_dir)'"\[${Yellow}\]\\$ \[${txtrst}\]"
export PS1="\[${Cyan}\]$host_short \[${Yellow}\]\w\[${Green}\]\$(___vcs_dir)\[${Yellow}\]\\$ \[${txtrst}\]"
export PS1="\`echo -e \"\[${Cyan}\]$host_short \[${Yellow}\]\w\[${Green}\]\[\$__vcs_color\]\$__vcs_branch\[${Yellow}\]\\$ \[${txtrst}\]\"\`"

if [[ `shopt -q login_shell` ]];
then

    . ~/.mkfifo.sh &

    update_session() {
      FIFO=/tmp/your_variables

      NVAR=$(cat $FIFO)
      for i in $(seq $NVAR); do
        export $(cat $FIFO)
      done
      #delete the pipe, or it will not work next time
      rm $FIFO
    }

fi


HISTSIZE=100000
export HISTSIZE

if test $SHLVL -gt 1; then
    source /etc/bashrc
    #source $HOME/.bash_profile
fi

# hipergator-specific things
module load screen
module load ufrc
#Unsafe to load
# (but necessary for ds9)
#module load gcc
# needed for any graphics... I don't remember what's unsafe though
module load gcc; module load libfuse

PATH=$PATH:/orange/adamginsburg/miniconda3/bin/

# 0022 -> me: rwx, group: rx, global: rx
umask 0022
#alias ll='ls -al --color=auto'

export PYSYN_CDBS=/orange/adamginsburg/synphot/grp/hst

alias gs9='/orange/adamginsburg/miniconda3/bin/python /orange/adamginsburg/repos/glue-cli/gs9.py'

export MNEST_DIR=/orange/adamginsburg/repos/MultiNest/MultiNest_v3.12_CMake/multinest

# getsf
export PATH=/orange/adamginsburg/repos/getsf/v210414/bin:$PATH


export RADEX_DATAPATH=/orange/adamginsburg/repos/pyradex/lamda/

export XCLASSRootDir=/orange/adamginsburg/software/XCLASS-Interface


export GITHUB_TOKEN=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
