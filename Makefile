prefix = /usr/local
exec_prefix = $(prefix)
libexecdir = $(exec_prefix)/libexec
systemd_unit_dir = $(prefix)/lib/systemd/system

GENERATED_FILES = no-kmod-autoload.service start.sh

.PHONY: all install clean
.SUFFIXES:

all: $(GENERATED_FILES)

%: %.in
	sed 's:@libexecdir@:$(libexecdir):g' < $< > $@

install: all
	install -Dt $(DESTDIR)$(libexecdir)/no-kmod-autoload start.sh modprobe.sh
	install -Dm644 -t $(DESTDIR)$(systemd_unit_dir) no-kmod-autoload.service

clean:
	$(RM) $(GENERATED_FILES)
