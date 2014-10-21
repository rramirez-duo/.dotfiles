DIR=/home/rramirez/.dotfiles

all: dotFileSymlinks 
	
linuxworkstation: customBins

dotFileSymlinks:
	@ln -sf $(DIR)/.ctags ~/.ctags
	@ln -sf $(DIR)/.gitconfig ~/.gitconfig
	@ln -sf $(DIR)/.tmux.conf ~/.tmux.conf
	@ln -sf $(DIR)/.vimrc ~/.vimrc
	@ln -sf $(DIR)/.xbindkeysrc ~/.xbindkeysrc
	@ln -sf $(DIR)/.xinitrc ~/.xinitrc
	@ln -sf $(DIR)/.Xresources ~/.Xresources
	@ln -sf $(DIR)/.xsetroot.sh ~/.xsetroot.sh
	@ln -sf $(DIR)/.zshrc ~/.zshrc

tmux:
	sudo killall tmux

vim:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

customBins:
	if [ ! -d ~/bin/ ]; \
	then \
		mkdir ~/bin/; \
	fi;
	# TODO iterate through executable files in ~/.dotfiles/
	@ln -sf $(DIR)/bin/cellwifi.sh ~/bin/cellwifi.sh
	@ln -sf $(DIR)/bin/cleanupOrphans.sh ~/bin/cleanupOrphans.sh
	@ln -sf $(DIR)/bin/disablewifi.sh ~/bin/disablewifi.sh
	@ln -sf $(DIR)/bin/homessh.sh ~/bin/homessh.sh
	@ln -sf $(DIR)/bin/pingGoogle.sh ~/bin/pingGoogle.sh
	@ln -sf $(DIR)/bin/workwifi.sh ~/bin/workwifi.sh
	@ln -sf $(DIR)/bin/xWindowStart.sh ~/bin/xWindowStart.sh
	@ln -sf $(DIR)/bin/logitech-t650-config.sh ~/bin/logitech-t650-config.sh
	@ln -sf $(DIR)/bin/trackpad-toggle.sh ~/bin/trackpad-toggle.sh
	@sudo ln -sf $(DIR)/bin/trackpad-toggle.sh /usr/bin/trackpad-toggle.sh

