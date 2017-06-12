AM_CFLAGS = -Wall -g -ggdb -O1

INCLUDES = -I@top_srcdir@/include -I@top_srcdir@/src/m1/include -I@top_srcdir@/src/m2/include 

# this lists the binaries to produce, the (non-PHONY, binary) targets in
# the previous manual Makefile
bin_PROGRAMS = tstapp
tstapp_SOURCES = main.c ../include/main.h m1/include/m1.h m2/include/m2.h m1/m1.c m2/m2.c
