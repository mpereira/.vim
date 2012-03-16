GIT := git
ifeq ($(shell uname), Darwin)
  VIM := mvim -v
else
  VIM := vim
endif

.PHONY: install_git_modules pull_git_modules update_vim_helptags

update_vim_helptags:
	$(VIM) -c 'call pathogen#helptags()|q'

install_git_modules:
	$(GIT) submodule init
	$(GIT) submodule update
	@make --no-print-directory update_vim_helptags

pull_git_modules:
	$(GIT) submodule foreach $(GIT) pull origin master
	@make --no-print-directory update_vim_helptags
