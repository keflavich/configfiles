from time import strftime
import os.path

ip = get_ipython()

#ldir = ip.profile_dir.log_dir 
ldir = os.getcwd()
fname = 'ipython_log_' + strftime('%Y-%m-%d') + ".py"
filename = os.path.join(ldir, fname)
notnew = os.path.exists(filename)


try:
  # Use run_line_magic instead of deprecated magic() method
  ip.run_line_magic('logstart', '-o %s append' % filename)
  
  # Write header information directly to the log file
  if ip.history_manager.output_hist_reprs:
      with open(filename, 'a') as f:
          if notnew:
              f.write("########################################################\n")
          else:
              f.write("#!/usr/bin/env python\n")
              f.write("# " + fname + "\n")
              f.write("# IPython automatic logging file\n")
          f.write("# Started Logging At: " + strftime('%Y-%m-%d %H:%M:%S') + "\n")
          f.write("########################################################\n")
  
  print(" Logging to "+filename)
except RuntimeError:
    # Get the current log filename from history_manager
    if hasattr(ip.history_manager, 'log_file') and ip.history_manager.log_file:
        print(" Already logging to "+ip.history_manager.log_file)
    else:
        print(" Logging may already be active")
