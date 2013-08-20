""" User configuration file for IPython

This is a more flexible and safe way to configure ipython than *rc files
(ipythonrc, ipythonrc-pysh etc.)

This file is always imported on ipython startup. You can import the
ipython extensions you need here (see IPython/Extensions directory).

Feel free to edit this file to customize your ipython experience.

Note that as such this file does nothing, for backwards compatibility.
Consult e.g. file 'ipy_profile_sh.py' for an example of the things 
you can do here.

See http://ipython.scipy.org/moin/IpythonExtensionApi for detailed
description on what you could do here.
"""

# Most of your config files and extensions will probably start with this import

import IPython.ipapi
ip = IPython.ipapi.get()

import sys
sys.path.reverse()
#sys.path.append('/Library/Python/2.5/site-packages')
#sys.path.append('/Library//Frameworks/Python.framework/Versions/2.5/lib/python2.5/site-packages')
#sys.path.append('/opt/local/bin/
sys.path.reverse()
#sys.path.append('/Library/Python/2.5/site-packages/coords')
#sys.path.append('/scisoft/i386/Packages/Python-2.5.1/Python.framework/Versions/2.5/lib/python2.5/site-packages/')
#sys.path.append('/scisoft/i386/Packages/Python-2.5.1/Python.framework/Versions/2.5/lib/python2.5/site-packages/pyephem-3.7.2.3-py2.5-macosx-10.4-i386.egg')
#sys.path.append('/Users/adam')
#sys.path.append('/Users/adam/agpy')
#sys.path.append('/Users/adam/work/code')
sys.path.append('/Users/adam/work/bolocam/AGidl/')
sys.path.append('/Users/adam/work/bolocam/AGidl/bgps_pipeline/cleaning/flagging/')
sys.output_line_width=180

# import PyQt4
# import PyQt4.QtCore
# PyQt4.QtCore.pyqtRemoveInputHook()

import pyfits
import re
def grep(string,list,opt=''):
    expr = re.compile(string)
    if opt=='-v':
        nexpr = lambda x: expr.search(x) == None
        return filter(nexpr,list)
    return filter(expr.search,list)

# You probably want to uncomment this if you did %upgrade -nolegacy
# import ipy_defaults    

def main():
    # Handy tab-completers for %cd, %run, import etc.
    # Try commenting this out if you have completion problems/slowness
    # import ipy_stock_completers
    
    # uncomment if you want to get ipython -p sh behaviour
    # without having to use command line switches
    
    # import ipy_profile_sh

    
    o = ip.options
    # An example on how to set options
    #o.autocall = 1
    o.system_verbose = 0

main()
