echo "Moving files to home directory..."
cp -v .vimrc ~
cp -v .tmux.conf ~
cp -v .bash_profile ~
cp -v .bashrc ~
mkdir -p ~/.vim/colors
cp -v themes/*.vim ~/.vim/colors/
echo "Done!"

echo "Installing vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Done!"

echo "Installing Vim plugins through Vundle..."
vim +PluginInstall +qall

echo "Putting snippets into place"
cp -vr ./snippets ~/.vim/

echo "All Done!"
