GIT := git

.PHONY: install_git_modules pull_git_modules

install_git_modules:
	$(GIT) submodule init
	$(GIT) submodule update

pull_git_modules:
	$(GIT) submodule foreach $(GIT) pull origin master
