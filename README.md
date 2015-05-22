# vim
My VIM setup sync repository.

Requires
mkdir ~/.vim
mkdir ~/.vim/bundle

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/.vim/.vimrc ~/.vimrc
#ln -s ~/.vim/.gist-vim ~/.gist-vim

vim +PluginInstall +qall

# Or just run vim and do a :PluginInstall
