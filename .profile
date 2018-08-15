#export PATH=/sw/bin:/opt/local/bin:/opt/local/sbin:/scisoft/i386/bin:$PATH:/usr/local/sbin/GCALDaemon/bin/
#. /sw/bin/init.sh
#alias pylab="ipython -pylab -log"


# Setting PATH for MacPython 2.5
# The orginal version is saved in .profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
#export PATH

#export IRAFARCH=redhat
#export IRAF=/scisoft/share/iraf/iraf/
#. /scisoft/all/bin/Setup.bash

#export TERM="vt100"

#. ~/.bashrc

#test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Setting PATH for EPD_free-7.1-2
# The orginal version is saved in .profile.pysave
# PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/Current/bin"
# export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH

#. /Users/adam/repos/docbook-xsl-1.76.1/.profile.incl

# Setting PATH for EPD-7.2-2
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}"
# export PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8



# modifications by HEALPixAutoConf 3.11
[ -r /Users/adam/.healpix/3_11_Darwin/config ] && . /Users/adam/.healpix/3_11_Darwin/config

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH
#. ~/.bashrc

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
