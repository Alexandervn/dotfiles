Dotfiles
========

Bunch of configuration files for in my homedir; including Vim config. 

Installation:
-------------

- git clone git://github.com/Alexandervn/dotfiles.git ~/.dotfiles
- cd ~/.dotfiles
- rake symlinks
- git submodule init
- git submodule update


And for Command-T, if Vim is compiled with Ruby and all other dependencies are there:
- cd ~/.dotfiles/vim/bundle/command-t/
- rake make
