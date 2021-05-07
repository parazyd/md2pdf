.POSIX:

PYTHON = python3
PREFIX = /usr/local

all:
	@$(PYTHON) -c 'import os' >/dev/null
	@$(PYTHON) -c 'import markdown' || (echo "Missing python-markdown"; exit 1)
	@$(PYTHON) -c 'import weasyprint' || (echo "Missing python-weasyprint"; exit 1)

install: all
	cp -f md2pdf $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/md2pdf

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/md2pdf

.PHONY: all install uninstall
