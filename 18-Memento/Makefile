OBJS = main.o Memento.o TextManager.o
PROGRAMS = a.out

CFLAGS = -O2
LFLAGS = -std=c++14

CC = g++

.SUFFIXES: .o .cpp
.PHONY: all clean

all: ${PROGRAMS}

.cpp.o:
		$(CC) $(CFLAGS) -c $<

a.out: $(OBJS)
		$(CC) $(CFLAGS) $(OBJS) $(LFLAGS)

TextManager.h TextManager.o main.o Memento.o:Memento.h
main.o TextManager.o:TextManager.h

.INTERMEDIATE: $(OBJS)

clean:
		$(RM) $(OBJS) $(PROGRAMS)