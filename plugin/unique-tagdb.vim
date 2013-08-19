python << EOF
import sys, os, vim, time

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

def reset_con(proj_path):
    if vim.eval("g:unique_tagdb_connected") == "1": 
        vim.command("silent cs kill cscope.out")
    else:
        vim.command("let g:unique_tagdb_connected=1")
    while not os.path.exists(os.path.join(proj_path, 'cscope.out')):
        print "Creating tags&cscope.out... Please wait for a while."
        time.sleep(1)
    vim.command("silent cs add " + os.path.join(proj_path, 'cscope.out'))
    return

def refresh_file():
    proj_path = get_proj_path()

    output = os.popen("""
        cd %s
        ctags --sort=foldcase -R --c++-kinds=+px --fields=+iaS --extra=+q .;
        find `pwd` -name '*.c' -o -name '*.h' -o -name '*.cpp' > cscope.files;
        cscope -Rbq;
        """
        % (proj_path)
    )

    reset_con(proj_path)

    if "".join(output.readlines()).strip() == '':
        print "Build/Refresh tagDB at " + proj_path + " successfully."
    else:
        print "Error: ".join(output.readlines()).strip()

    return

def refresh_con():
    proj_path = get_proj_path()
    reset_con(proj_path)
    print "Refresh cscope connection successfully."
    return

init_proj_path = get_proj_path()
if os.path.exists(os.path.join(init_proj_path, 'cscope.out')):
    vim.command("silent cs add " + os.path.join(init_proj_path, 'cscope.out'))
    vim.command("let g:unique_tagdb_connected=1")
else:
    vim.command("let g:unique_tagdb_connected=0")

EOF

command! -nargs=0 UniqueTagDBRefreshFile exec('py refresh_file()')
command! -nargs=0 UniqueTagDBRefreshCon exec('py refresh_con()')


