##
##  Makefile -- Build procedure for sample authn_yubikey Apache module
##  Autogenerated via ``apxs -n authn_yubikey -g''.
##

builddir=.
top_srcdir=/usr/share/apache2
top_builddir=/usr/share/apache2
include /usr/share/apache2/build/special.mk

#   the used tools
APXS=apxs
APACHECTL=apachectl

#   additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
DEFS=-DYK_PACKAGE=\"mod_authn_yubikey\" -DYK_PACKAGE_VERSION=\"0.1\"

#INCLUDES=-Imy/include/dir
#LIBS=-Lmy/lib/dir -lmylib
LIBS=-lcurl -lykclient -L/usr/local/lib

#   the default target
all: local-shared-build install install_default_config

#   install the shared object file into Apache 
install: install-modules-yes

#   cleanup
clean:
	-rm -f mod_authn_yubikey.o mod_authn_yubikey.lo mod_authn_yubikey.slo mod_authn_yubikey.la 

#   simple test
test: reload
	lynx -mime_header http://localhost/authn_yubikey

#   install and activate shared object by reloading Apache to
#   force a reload of the shared object file
reload: install restart

#   the general Apache start/restart/stop
#   procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop

install_default_config:
	@echo "copy default config"
	cp authn_yubikey.load /etc/apache2/mods-available
	cp authn_yubikey.conf /etc/apache2/mods-available
