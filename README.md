### what this simple script can do

It can build an unique tag database for ctags & cscope in you project, whenever you input cmd **:CtagsCscopeRefresh** or press the hotkey that maps to this cmd.

### How to install it

An easy way is to put ctags_cscope_refresh into .vim/Plugin/ .

But I highly recommend you to use [Bundle](https://github.com/gmarik/vundle.git) to install it:

	Bundle 'chetui/ctags_cscope_refresh'

Option:

You can map a hotkey to this script.

Add following line into your .vimrc:

	nmap <C-@><C-@> :CtagsCscopeRefresh<CR>

You can replace the key youself.

### How to use it

When you want to build the tag database in your new projec **at the  first time**:

you should open the Vim in **your project's root path**, (eg. /home/chetui/my_project/), and input cmd :CtagsCscopeRefresh or press the hotkey that maps to this cmd.

When you open the Vim **next time**:

if **your current Vim's path is in your project's path (including any subpaths)**, then you can just use any of the two ways to refresh your tag database at anytime.


#### Enjoy it!
