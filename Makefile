
all:

# Include setting from the configure script
-include config.make

all: pspg

pspg: src/unicode.h src/pspg.c src/unicode.c src/themes.c src/print.c config.make
	$(CC) -O3 src/pspg.c src/print.c src/unicode.c src/themes.c -o pspg $(CFLAGS) $(LDFLAGS) $(LDLIBS)

clean:
	$(RM) src/pspg.o
	$(RM) src/unicode.o
	$(RM) src/themes.o
	$(RM) src/print.o
	$(RM) pspg
	
distclean: clean
	$(RM) -r autom4te.cache
	$(RM) aclocal.m4 configure
	$(RM) config.h config.log config.make config.status config.h.in

install: all
	tools/install.sh bin pspg "$(DESTDIR)$(bindir)"
