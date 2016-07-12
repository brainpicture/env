all:
	@git submodule update --init --recursive
	@mkdir -p ./backup
	@-test -e  ~/.vimrc && mv ~/.vimrc ./backup/.vimrc
	@ln -sF $(PWD)/vim/init.vim ~/.vimrc
	@-test -e  ~/.bashrc && mv ~/.bashrc ./backup/.bashrc
	@ln -sF $(PWD)/bashrc ~/.bashrc
	@-test -e  ~/.bash_profile && mv ~/.bash_profile ./backup/.bash_profile
	@ln -sF $(PWD)/bash_profile ~/.bash_profile
	@-test -e  ~/.vim && mv ~/.vim ./backup/.vim
	@ln -sF $(PWD)/vim ~/.vim
	@mkdir -p ~/.config
	@ln -sF $(PWD)/vim ~/.config/nvim
	@-test -e  ~/.tmux.conf && mv ~/.tmux.conf ./backup/.tmux.conf
	@ln -sF $(PWD)/tmux.conf ~/.tmux.conf
	@-test -e  ~/.inputrc && mv ~/.inputrc ./backup/.inputrc
	@ln -sF $(PWD)/inputrc ~/.inputrc
	@echo 'SUCCESS'
