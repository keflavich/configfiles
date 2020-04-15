python
import gdb
import sys
import os
sys.path.insert(0, os.path.expanduser("~/.gdb/libpython.py"))
def setup_python(event):
    import libpython
gdb.events.new_objfile.connect(setup_python)
print("Successfully added libpython to gdb")
end
