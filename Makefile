CC=gcc
CFLAGS=-W -Wall -Wextra -O2 -fstack-protector-all
DFLAGS=-D_FORTIFY_SOURCE=2
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LDFLAGS=-Wl,-lcurl
else
	LDFLAGS=-Wl,-z,relro,-z,now -lcurl
endif

#LDFLAGS=-lcurl


0d1n: 0d1n.c 
	$(CC) $(CFLAGS) $(DFLAGS) -c *.c
	$(CC) -o 0d1n *.o $(LDFLAGS)

clean:
	rm -f *.o 0d1n
