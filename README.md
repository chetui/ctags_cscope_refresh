### What this simple script can do

It is a Vim plugin, which can build and manage an **unique** tag database for ctags & cscope in your project.

### How to install

* Make sure you are using MAC OS X or Linux.
* Make sure your ctags & cscope are installed correctly.

An easy way is to put unique-tagdb.vim into .vim/Plugin/ .

But I highly recommend you to use [Bundle](https://github.com/gmarik/vundle.git) to install it:

	Bundle 'chetui/unique-tagdb'

You can map hotkeys to this script.

Add following lines into your .vimrc:

	nmap <C-@><C-f> :UniqueTagDBRefreshFile <CR>
	nmap <C-@><C-c> :UniqueTagDBRefreshCon <CR>
	nmap <C-@><C-s> :cs show <CR>

You can replace the keys youself.

### How to use

When you want to build the tag database in your new projec **at the  first time**:

* you should open the Vim in **your project's root path**, (eg. /home/chetui/my_project/), and press the hotkey \<C-@\>\<C-f\>.

When you open the Vim **next time**:

* if **the path of your current editing file is in your project's path (including any subpaths)**, then you can press the hotkey \<C-@\>\<C-f\> to refresh your tag database at anytime.

### How to use when I edit files of different projects

The Vim should only use one cscope.out at a time (otherwise it is not good for the localization accuracy).

* Hence, when you switch files of different projects in the Vim, you should press the hotkey \<C-@\>\<C-c\> to switch cscope.out mannually. 

* Before switching cscope.out, you can also press the hotkey \<C-@\>\<C-s\> to show which cscope.out you are using.

### Bug Report

You are welcome to send me an email <yuxinjie@zju.edu.cn> to report bugs.

#### Enjoy it!



