# # Source, Executable, Includes, Library Defines
# INCL   = include/main.h src/m1/include/m1.h src/m2/include/m2.h
# SRC    = main.c m1.c m2.c
# OBJ    = $(SRC:.c=.o)
# LIBS   = -lm
# EXE    = testApp
#
# # Compiler, Linker Defines
# CC      = /usr/bin/gcc
# CFLAGS  = -ansi -pedantic -Wall
# LIBPATH = -L.
# LDFLAGS = -o $(EXE) $(LIBPATH) $(LIBS)
# CFDEBUG = -ansi -pedantic -Wall -g -DDEBUG $(LDFLAGS)
# RM      = /bin/rm -f
#
# # Compile and Assemble C Source Files into Object Files
# %.o: %.c
# 	$(CC) -c $(CFLAGS) $*.c -Iinclude/main.h -Isrc/m1/include/m1.h -Isrc/m2/include/m2.h
#
# # Link all Object Files with external Libraries into Binaries
# $(EXE): $(OBJ)
# 	$(CC) $(LDFLAGS) $(OBJ)
#
# # Objects depend on these Libraries
# $(OBJ): $(INCL)
#
# # Create a gdb/dbx Capable Executable with DEBUG flags turned on
# debug:
# 	$(CC) $(CFDEBUG) $(SRC)
#
# # Clean Up Objects, Exectuables, Dumps out of source directory
# clean:
#
# $(error $(addprefix -I, $(shell find . -name *.h)))
#

# Source, Executable, Includes, Library Defines
INCL   = include/ src/m1/include/ src/m2/include/
#INCL   = $(addprefix -I, $(shell find . -name *.h))
SRC    = main.c m1.c m2.c
OBJ    = $(SRC:.c=.o)
LIBS   = -lm
OUT		 = output/
EXE    = testApp

# Compiler, Linker Defines
CC      = /usr/bin/gcc
#CFLAGS  = -ansi -pedantic -Wall
LDFLAGS = -o $(OUT)$(EXE)
#CFDEBUG = -ansi -pedantic -Wall -g -DDEBUG $(LDFLAGS)
RM      = /bin/rm -f


all : $(EXE)

# $(EXE) : $(addprefix $(OUT),$(OBJ))
# 	$(CC) $(LDFLAGS) $(addprefix $(OUT),$(OBJ)) $(LIBS)
$(EXE) : $(addprefix $(OUT),$(OBJ))
	$(CC) $(LDFLAGS) $(addprefix $(OUT),$(OBJ)) $(addprefix -I,$(INCL)) -lm
$(OUT)%.o : %.c
	$(CC) -c -o $@ $< $(addprefix -I,$(INCL)) $(LIBS)
# %.c:%.o
# 	$(CC) -c -o $@ $< $(INCL) $(LIBS)

output/m1.o : src/m1/m1.c
	gcc -c -o output/m1.o src/m1/m1.c $(addprefix -I,$(INCL))
output/m2.o : src/m2/m2.c
	gcc -c -o output/m2.o src/m2/m2.c $(addprefix -I,$(INCL))

install_strip:

install:

unistall:


.PHONY:clean
clean:
	$(RM) $(OUT)*
