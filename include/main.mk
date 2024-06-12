mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))
libuv_path := $(mkfile_dir)../deps/libuv

CC = gcc
CFLAGS ?= -g -Wall -pedantic
SRCMODULES ?= 
OBJMODULES = $(SRCMODULES:.c=.o)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: run
run: clean main
	./main

main: main.c $(OBJMODULES)
	$(CC) $(CFLAGS) $^ -I $(libuv_path)/include/ -L $(libuv_path)/build -luv -o $@

.PHONY: clean
clean:
	rm -f *.o main
