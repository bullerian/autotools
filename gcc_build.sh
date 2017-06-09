#!/bin/bash

# Command for compiling simple C program

gcc -o ./output/simple.out main.c src/m1/m1.c src/m2/m2.c -Isrc/m1/include/ -Isrc/m2/include/ -Iinclude/ -lm
