SRC=src
SRCS = $(SRC)/tcpmdm.c $(SRC)/bridge.c $(SRC)/debug.c $(SRC)/getcmd.c $(SRC)/ip.c $(SRC)/init.c $(SRC)/modem_core.c $(SRC)/nvt.c $(SRC)/serial.c $(SRC)/util.c $(SRC)/phone_book.c $(SRC)/shared.c $(SRC)/tcpser.c $(SRC)/line.c $(SRC)/dce.c
SEROBJS = $(SRC)/bridge.o $(SRC)/debug.o $(SRC)/getcmd.o $(SRC)/ip.o $(SRC)/init.o $(SRC)/modem_core.o $(SRC)/nvt.o $(SRC)/serial.o $(SRC)/util.o $(SRC)/phone_book.o $(SRC)/shared.o $(SRC)/tcpser.o $(SRC)/dce.o $(SRC)/line.o
MDMOBJS = $(SRC)/debug.o $(SRC)/ip.o $(SRC)/serial.o $(SRC)/util.o $(SRC)/tcpmdm.o
CC = gcc
DEF = 
CFLAGS = -O $(DEF) -ggdb
LDFLAGS = -s -lpthread
DEPEND = makedepend $(DEF) $(CFLAGS)

all:	tcpser tcpmdm

#.o.c:
#	$(CC) $(CFLAGS) -c $*.c

$(SRCS):
	$(CC) $(CFLAGS) -c $*.c

tcpmdm: $(MDMOBJS)
	$(CC) $(LDFLAGS) -o $@ $(MDMOBJS)

tcpser: $(SEROBJS)
	$(CC) $(LDFLAGS) -o $@ $(SEROBJS)

depend: $(SRCS)
	$(DEPEND) $(SRCS)

clean:
	-rm tcpser tcpmdm *.bak $(SRC)/*~ $(SRC)/*.o $(SRC)/*.bak core


# DO NOT DELETE THIS LINE -- make depend depends on it.