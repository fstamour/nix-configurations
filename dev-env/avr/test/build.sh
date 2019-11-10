#!/usr/bin/env bash
set -x

MICRO=atmega168
CC_FLAGS="-g -Os -mmcu=${MICRO}"
LD_FLAGS="-g -mmcu=${MICRO}"

# Compile
avr-gcc ${CC_FLAGS} -c blink.c -o blink.o

# Link
avr-gcc ${LD_FLAGS} blink.o -o blink.elf

# Generating [Intel] hex files
avr-objcopy -j .text -j .data -O ihex blink.elf blink.hex

