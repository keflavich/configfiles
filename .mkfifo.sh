#!/bin/bash
FIFO=~/.fifo_vars
[ -e $FIFO ] && cat $FIFO > /dev/null || mkfifo $FIFO

# save number of variables that follow
NVARS=1
echo $NVARS > $FIFO
echo DISPLAY=$DISPLAY > $FIFO
#echo ENV2=sth2 > $FIFO
#Start that script in the background on login (it will only terminate when all variables are read from it).

#Now you can read from the fifo, e.g. add this function to your .bashrc

#so that you can in your old screen session
#update_session

# Most of this script and the corresponding script in .bashrc came from:
# http://superuser.com/questions/105954/updating-screen-session-environment-variables-to-reflect-new-graphical-login
