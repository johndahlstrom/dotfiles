echo "Moving files to home directory..."
cp -v .vimrc ~
cp -v .tmux.conf ~
cp -v .bashrc ~
echo "Done!"

echo "Installing vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Done!"

echo "Installing Vim plugins through Vundle..."
vim +PluginInstall +qall

echo "All Done!"
