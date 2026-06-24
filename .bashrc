
set -o noclobber
set -o ignoreeof

shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 2026-06-24 removed mkfifo stuff; I don't really know what it does

export HISTTIMEFORMAT="%d/%m/%y %T "
HISTSIZE=10000000
export HISTSIZE
export HISTCONTROL=ignoredups:erasedups

if test $SHLVL -gt 1; then
    source /etc/bashrc
    #source $HOME/.bash_profile
fi


#export PATH=$PATH:/blue/adamginsburg/adamginsburg/miniconda3/bin/
# forcibly remove /orange version (I don't know where it's getting set)
export PATH=$(echo $PATH | sed s./orange/adamginsburg/miniconda3/bin:..)


# 0022 -> me: rwx, group: rx, global: rx
umask 0022
alias ll='ls -al --color=auto'

export PYSYN_CDBS=/orange/adamginsburg/synphot/grp/hst/cdbs

alias gs9='/blue/adamginsburg/adamginsburg/miniconda3/bin/python /blue/adamginsburg/adamginsburg/repos/glue-cli/gs9.py'

export MNEST_DIR=/orange/adamginsburg/repos/MultiNest/MultiNest_v3.12_CMake/multinest

# getsf
export PATH=/orange/adamginsburg/repos/getsf/v210414/bin:$PATH


export RADEX_DATAPATH=/orange/adamginsburg/repos/pyradex/lamda/

export XCLASSRootDir=/orange/adamginsburg/software/XCLASS-Interface

. ~/.gh_token

# April 13, 2022
export JUPYTER_CONFIG_DIR=/blue/adamginsburg/adamginsburg/.jupyter/
export IPYTHON_DIR=/blue/adamginsburg/adamginsburg/.ipython/

export PYTHONDONTWRITEBYTECODE=1

# July 14, 2022
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

export GETSF_BIN=/orange/adamginsburg/repos/getsf/v210414/bin/+GETSF

export WEBBPSF_PATH=/orange/adamginsburg/repos/webbpsf/data/
export STPSF_PATH=/orange/adamginsburg/repos/webbpsf/data/
export MAST_API_TOKEN=`cat ~/.mast_api_token`
export MIRAGE_DATA=/orange/adamginsburg/software/mirage
export CRDS_PATH=/orange/adamginsburg/jwst/crds

# 2026-06-16: vscode gets hung if .bash does stuff
# but if we don't include the stuff above, the vscode terminals are not functional (they lack color-coding etc)
if [[ "$TERM_PROGRAM" == "vscode" || -n "${VSCODE_IPC_HOOK_CLI:-}" || -n "${VSCODE_CWD:-}" ]]; then
    return 0 2>/dev/null || exit 0
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/orange/adamginsburg/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/orange/adamginsburg/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/orange/adamginsburg/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/orange/adamginsburg/miniconda3/envs/python313/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/orange/adamginsburg/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/orange/adamginsburg/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


source /orange/adamginsburg/miniconda3/bin/activate /blue/adamginsburg/adamginsburg/miniconda3/envs/python313


alias ag="/apps/the_silver_searcher/2.2.0/bin/ag --noaffinity"
. "$HOME/.local/bin/env"

