set number
syntax on

source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

"always show statusline
set laststatus=2

"use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
   endif
endif
