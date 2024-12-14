LUA_VERSION ?= jit
LUA_PKG		?= lua$(LUA_VERSION)
LUA_CFLAGS	?= $(shell pkg-config --cflags $(LUA_PKG))
LUA_CMOD	?= $(shell pkg-config --variable=INSTALL_CMOD $(LUA_PKG))

maxminddb.so: maxminddb.c
	$(CC) $(CFLAGS) -fPIC -std=c99 $(LUA_CFLAGS) -shared $< -o $@ $(LDFLAGS) -lmaxminddb

install:
	install -d $(DESTDIR)$(LUA_CMOD)
	install -c maxminddb.so $(DESTDIR)$(LUA_CMOD)

clean:
	rm -f maxminddb.so
