set -o noclobber
set -o ignoreeof

shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob
shopt -s checkwinsize

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

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

export PATH=/home/aginsbur/bin/:/scratch/aginsbur/casa/casapy-stable-42.0.26945-001-64b/bin:/home/aginsbur/anaconda/bin/:$PATH

HISTSIZE=100000
export HISTSIZE

export PATH=/usr/lib64/casapy/bin/:$PATH
alias gbtidl="/opt/local/bin/gbtidl ~/.idl/idlrc"

if test $SHLVL -gt 1; then
    source /etc/bashrc
    #source $HOME/.bash_profile
fi

# added by Anaconda 1.6.1 installer
export PATH="/users/aginsbur/anaconda/bin:$PATH"

## added by Miniconda 3.3.0 installer
#export PATH="/users/aginsbur/miniconda/bin:$PATH"

# added by Anaconda3 installer
export PATH="/lustre/naasc/users/aginsbur/anaconda/bin:$PATH"
alias vncserver='PATH=/bin:/usr/bin vncserver $*'
