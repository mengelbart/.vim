
.PHONY: install
install:
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	sudo ln -snf "$(HOME)/.vim" /root/.vim
	sudo ln -snf "$(HOME)/.vimrc" /root/.vimrc

.PHONY: update
update:
	git submodule update --init --recursive
	git submodule foreach git pull --recurse-submodules origin master

.PHONY: README.md
README.md:
	@awk '!/https:\/\//' README.md > temp && mv temp README.md
	@echo '[Pathogen](https://github.com/tpope/vim-pathogen.git)\n' >> $@
	@git submodule --quiet foreach 'echo \* [`git config --get remote.origin.url | sed "s#https://##g"`]\(`git config --get remote.origin.url`\)\' >> $@
