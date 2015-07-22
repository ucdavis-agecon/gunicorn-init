all:
	@echo ""
	@echo "Please use one of the following targets:"
	@echo "    install: install all files"
	@echo "    uninstall: uninstall all files"
	@echo ""

install: sudo-check
	[ -d /etc/gunicorn ] || mkdir /etc/gunicorn
	[ -d /etc/defaults ] || mkdir /etc/defaults
	[ -d /var/run/gunicorn ] || mkdir /var/run/gunicorn
	ln -s `pwd`/tree/etc/init.d/gunicorn /etc/init.d/gunicorn

uninstall: sudo-check
	rm -rf /etc/init.d/gunicorn

sudo-check:
	@if [ "$$UID" != 0 ] ; then echo "You don't have permission to install. Try using sudo." ; exit 1 ; fi
