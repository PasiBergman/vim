# vim
My VIM setup sync repository.

On macOS install VIM with 
`brew install vim`

On Linux install VIM with
`sudo apt-get update && sudo apt-get install -y vim`

Requires
```bash
mkdir ~/.vim ~/.vim/bundle
git clone https://github.com/PasiBergman/vim.git ~
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/vim/.vimrc ~/.vimrc
```

Start `vim` and do a **:PluginInstall**

