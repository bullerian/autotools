TARGET			 := tstapp
SRC					 := main.c m1.c m2.c
INCL				 := include src/m1/include src/m2/include
OBJS  			  = $(SRC:.c=.o)
ASMS					= $(SRC:.c=.s)
LIBS  			  = -lm
BIN_DIR 			= output
OUTPUT_OPTION = -o $(BIN_DIR)/$@
RM      			= /bin/rm -f
CPPFLAGS 		 += $(addprefix -I, $(INCL))
CFLAGS			 += -Wall -O0 -g -ggdb
VPATH 				= $(BIN_DIR)
DESTDIR 			= /usr/local/bin

vpath %.c src:src/m1:src/m2

.PHONY: all
all: $(TARGET) ASM

$(TARGET) : $(OBJS)
	$(LINK.o) $(addprefix $(BIN_DIR)/,$^) $(LIBS) $(OUTPUT_OPTION)

%.o: %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<

.PHONY: install
install : $(TARGET)
	install $(BIN_DIR)/$(TARGET) $(DESTDIR)

.PHONY: unistall
unistall :
	$(RM) $(DESTDIR)/$(TARGET)

.PHONY: install-strip
install-strip :
	$(MAKE) INSTALL_PROGRAM='$(INSTALL_PROGRAM) -s' \
				  install

.PHONY: ASM
ASM : $(ASMS)

%.s: %.c
	$(PREPROCESS.S) $< $(OUTPUT_OPTION)

.PHONY: clean
clean:
	$(RM) $(BIN_DIR)/*



























# # # Source, Executable, Includes, Library Defines
# # INCL   = include/main.h src/m1/include/m1.h src/m2/include/m2.h
# # SRC    = main.c m1.c m2.c
# # OBJ    = $(SRC:.c=.o)
# # LIBS   = -lm
# # EXE    = testApp
# #
# # # Compiler, Linker Defines
# # CC      = /usr/bin/gcc
# # CFLAGS  = -ansi -pedantic -Wall
# # LIBPATH = -L.
# # LDFLAGS = -o $(EXE) $(LIBPATH) $(LIBS)
# # CFDEBUG = -ansi -pedantic -Wall -g -DDEBUG $(LDFLAGS)
# # RM      = /bin/rm -f
# #
# # # Compile and Assemble C Source Files into Object Files
# # %.o: %.c
# # 	$(CC) -c $(CFLAGS) $*.c -Iinclude/main.h -Isrc/m1/include/m1.h -Isrc/m2/include/m2.h
# #
# # # Link all Object Files with external Libraries into Binaries
# # $(EXE): $(OBJ)
# # 	$(CC) $(LDFLAGS) $(OBJ)
# #
# # # Objects depend on these Libraries
# # $(OBJ): $(INCL)
# #
# # # Create a gdb/dbx Capable Executable with DEBUG flags turned on
# # debug:
# # 	$(CC) $(CFDEBUG) $(SRC)
# #
# # # Clean Up Objects, Exectuables, Dumps out of source directory
# # clean:
# #
# # $(error $(addprefix -I, $(shell find . -name *.h)))
# #
#
# # Source, Executable, Includes, Library Defines
# INCL   = include/ src/m1/include/ src/m2/include/
# #INCL   = $(addprefix -I, $(shell find . -name *.h))
# SRC    = main.c m1.c m2.c
# OBJ    = $(SRC:.c=.o)
# LIBS   = -lm
# BIN_DIR		 = output/
# EXE    = testApp
#
# # Compiler, Linker Defines
# #CFLAGS  = -ansi -pedantic -Wall
# LDFLAGS = -o $(BIN_DIR)$(EXE)
# #CFDEBUG = -ansi -pedantic -Wall -g -DDEBUG $(LDFLAGS)
# RM      = /bin/rm -f
#
#
# all : $(EXE)
#
# # $(EXE) : $(addprefix $(BIN_DIR),$(OBJ))
# # 	$(CC) $(LDFLAGS) $(addprefix $(BIN_DIR),$(OBJ)) $(LIBS)
# $(EXE) : $(addprefix $(BIN_DIR),$(OBJ))
# 	$(CC) $(LDFLAGS) $(addprefix $(BIN_DIR),$(OBJ)) $(addprefix -I,$(INCL)) -lm
# $(BIN_DIR)%.o : %.c
# 	$(CC) -c -o $@ $< $(addprefix -I,$(INCL)) $(LIBS)
# # %.c:%.o
# # 	$(CC) -c -o $@ $< $(INCL) $(LIBS)
#
# output/m1.o : src/m1/m1.c
# 	gcc -c -o output/m1.o src/m1/m1.c $(addprefix -I,$(INCL))
# output/m2.o : src/m2/m2.c
# 	gcc -c -o output/m2.o src/m2/m2.c $(addprefix -I,$(INCL))
#
# install_strip:
#
# install:
#
# unistall:
#
#
# .PHONY: all clean
# clean:
# 	$(RM) $(BIN_DIR)*
