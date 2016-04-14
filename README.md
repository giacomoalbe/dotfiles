## DotFiles

This repo contains all the dotfiles for configuration of vim and tmux.

More to be added later.

This are used to keep in sync all workstations.

## How to use this dotfiles

Copy this two commands (they are for creating symlinks to this original assets)


First of all symlink everything:

```cd ```
```ln -s .dotfiles/.vim .vim```
```ln -s .dotfiles/.vimrc .vimrc```

After that install ``Vundle`` with:

```git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle/```

After that into Vim, run ```:PluginInstall``` and the game is done!


