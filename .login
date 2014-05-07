#
# .login - initialization file for the C-shell
# Executed after .cshrc by any login shell
# 
if ( -f /usr/local/lib/System.login ) then
  source /usr/local/lib/System.login
endif
#
setenv    PRINTER ppbla9
setenv    LPDEST  ppbla9
setenv LD_LIBRARY_PATH /opt/SUNWspro/lib:/usr/ccs/lib:$LD_LIBRARY_PATH
set path=(/opt/SUNWspro/bin $path)

. ~/.bashrc

. ~/.mkfifo.sh &
