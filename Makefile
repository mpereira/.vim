GIT                             := git
VIM                             := mvim -v

SBT_VERSION                     := 0.13.0
SBT_RELEASE_DEB                 := sbt.deb
SBT_DEB_URL                     := http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/$(SBT_VERSION)/$(SBT_RELEASE_DEB)

ECLIPSE_RELEASE                 := kepler
ECLIPSE_HOME                    := $(HOME)/.eclipse
ECLIPSE_RELEASE_ARCHIVE         := eclipse-standard-$(ECLIPSE_RELEASE)-R-linux-gtk-x86_64.tar.gz
ECLIPSE_ARCHIVE_URL             := http://espelhos.edugraf.ufsc.br/eclipse//technology/epp/downloads/release/$(ECLIPSE_RELEASE)/R/$(ECLIPSE_RELEASE_ARCHIVE)

ECLIM_VERSION                   := 2.3.2
ECLIM_JAR                       := eclim_$(ECLIM_VERSION).jar
ECLIM_JAR_URL                   := http://sourceforge.net/projects/eclim/files/eclim/$(ECLIM_VERSION)/$(ECLIM_JAR)/download

LEININGEN_STABLE_BIN_URL        := https://raw.github.com/technomancy/leiningen/stable/bin/lein
LEININGEN_INSTALLATION_BIN_PATH := /usr/bin/lein

.PHONY: \
        eclim \
        eclipse \
        eclipse_eclim_plugins \
        install_git_modules \
        pull_git_modules \
        sbt \
        update_vim_helptags \
        vim \
        vimproc.vim

vim:
	wget -nc https://github.com/macvim-dev/macvim/archive/snapshot-104.tar.gz -P /tmp
	tar -xjvf /tmp/snapshot-104.tar.gz -C /tmp
	cd /tmp/macvim-snapshot-104 && ./configure \
		--enable-fail-if-missing \
		--enable-luainterp \
		--enable-perlinterp \
		--enable-pythoninterp \
		--enable-python3interp \
		--enable-rubyinterp \
		--enable-cscope \
		--enable-gui=auto \
		--disable-netbeans \
		--enable-multibyte \
		--with-luajit \
		--with-features=huge \
		--with-compiledby='Murilo Pereira <murilo@murilopereira.com>'
	# cp patches/os_unix_c_830_13_error_conflicting_types_for_sigaltstack_fix.diff /tmp/macvim-snapshot-73
	# cd /tmp/macvim-snapshot-73 && git apply os_unix_c_830_13_error_conflicting_types_for_sigaltstack_fix.diff
	cd /tmp/macvim-snapshot-104 && make
	cd /tmp/macvim-snapshot-104 && sudo make install

vimproc.vim:
	cd bundle/vimproc.vim && make -f make_mac.mak

sbt:
	wget $(SBT_DEB_URL) -P /tmp
	sudo dpkg -i /tmp/$(SBT_RELEASE_DEB)

eclipse:
	wget $(ECLIPSE_ARCHIVE_URL) -P /tmp
	if [ -d $(ECLIPSE_HOME) ]; then mv $(ECLIPSE_HOME) $(HOME)/.eclipse_$(shell date +'%Y%m%d%H%M%S'); fi
	if ! [ -d $(ECLIPSE_HOME) ]; then mkdir $(ECLIPSE_HOME); fi
	tar -xvf /tmp/$(ECLIPSE_RELEASE_ARCHIVE) -C $(ECLIPSE_HOME) --strip 1

eclipse_eclim_plugins: eclipse
	eclipse -consolelog -debug -nosplash \
		-application org.eclipse.equinox.p2.director \
		-repository "http://download.eclipse.org/releases/$(ECLIPSE_RELEASE),http://download.scala-ide.org/sdk/e38/scala210/stable/site" \
		-installIU "org.eclipse.jdt.feature.group" \
		-installIU "org.eclipse.cdt.feature.group" \
		-installIU "org.eclipse.dltk.core.feature.group" \
		-installIU "org.eclipse.dltk.ruby.feature.group" \
		-installIU "org.eclipse.wst.web_ui.feature.feature.group" \
		-installIU "org.scala-ide.sdt.feature.feature.group"

eclim: eclipse_eclim_plugins
	wget --trust-server-names $(ECLIM_JAR_URL) -P /tmp
	java \
		-Dvim.files=$(HOME)/.vim \
		-Declipse.home=$(ECLIPSE_HOME) \
		-jar /tmp/$(ECLIM_JAR) install
	mkdir bundle/eclim
	mv eclim plugin target bundle/eclim

leiningen:
	wget --no-check-certificate -O $(LEININGEN_INSTALLATION_BIN_PATH) $(LEININGEN_STABLE_BIN_URL)
	chmod 755 $(LEININGEN_INSTALLATION_BIN_PATH)

update_vim_helptags:
	$(VIM) -c 'call pathogen#helptags()|q'

install_git_modules:
	$(GIT) submodule init
	$(GIT) submodule update
	@make --no-print-directory update_vim_helptags

pull_git_modules:
	until $(GIT) submodule foreach $(GIT) pull origin master; do :; done
	@make --no-print-directory update_vim_helptags
