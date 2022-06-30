set -o noclobber
set -o ignoreeof

shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8




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


export HISTTIMEFORMAT="%d/%m/%y %T "
HISTSIZE=10000000
export HISTSIZE

if test $SHLVL -gt 1; then
    source /etc/bashrc
    #source $HOME/.bash_profile
fi


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

. ~/.gh_token

# April 13, 2022
export JUPYTER_CONFIG_DIR=/blue/adamginsburg/adamginsburg/.jupyter/
export IPYTHON_DIR=/blue/adamginsburg/adamginsburg/.ipython/
