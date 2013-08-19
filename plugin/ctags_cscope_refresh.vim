python << EOF
import sys, os

def get_proj_path():
    cur_path = os.getcwd()
    num = len(cur_path.split('/'))

    for i in range(0, num):
        if os.path.exists(os.path.join(cur_path, "tags")) and os.path.exists(os.path.join(cur_path, "cscope.out")):
            proj_path = cur_path
            break
        else:
            cur_path = os.path.abspath(os.path.join(cur_path, ".."))
    else:
        proj_path = os.getcwd()

    return proj_path
    
def ctags_cscope_refresh():
    proj_path = get_proj_path()

    output = os.popen("""
        cd %s
        ctags --sort=foldcase -R --c++-kinds=+px --fields=+iaS --extra=+q .;
        find `pwd` -name '*.c' -o -name '*.h' -o -name '*.cpp' > cscope.files;
        cscope -Rbq;
        """
        % (proj_path)
    )

    if "".join(output.readlines()).strip() == '':
        print "Build/Refresh ctags&cscope at " + proj_path + " successfully."
    else:
        print "Error: ".join(output.readlines()).strip()
EOF

command! -nargs=0 CtagsCscopeRefresh exec('py ctags_cscope_refresh()')
