# .bash_profile


echo "Path in .bash_profile=$PATH"

# Suppress libarrow GDB setup errors
export _LA_DEBUG=0

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

echo "Setting up shell prompt"
. ~/.vcs.sh
. ~/.colors

echo "Done loading .vcs.sh and .colors"
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

# 2026-06-16: vscode gets hung if .bash does stuff
if [[ "$TERM_PROGRAM" == "vscode" || -n "${VSCODE_IPC_HOOK_CLI:-}" || -n "${VSCODE_CWD:-}" ]]; then
    return 0 2>/dev/null || exit 0
fi



echo "Loading modules"
# hipergator-specific things
#module load screen
module load ufrc
#Unsafe to load
# (but necessary for ds9)
#module load gcc
# needed for any graphics... I don't remember what's unsafe though
module load gcc; module load libfuse
module load gsl

# I can't run a prompt without this any more 2025-08-17
module load the_silver_searcher
# fix for --no-affinity errors
export KMP_AFFINITY=disabled



echo "Loaded .bash_profile"

. "$HOME/.local/bin/env"
