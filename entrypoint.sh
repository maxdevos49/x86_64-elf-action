#!/bin/sh -l

command -v gcc >/dev/null 2>&1 || { echo >&2 "I require gcc but it's not installed.  Aborting."; exit 1; }
command -v ld >/dev/null 2>&1 || { echo >&2 "I require ld but it's not installed.  Aborting."; exit 1; }
command -v nasm >/dev/null 2>&1 || { echo >&2 "I require nasm but it's not installed.  Aborting."; exit 1; }
command -v make >/dev/null 2>&1 || { echo >&2 "I require make but it's not installed.  Aborting."; exit 1; }
command -v xorriso >/dev/null 2>&1 || { echo >&2 "I require xorriso but it's not installed.  Aborting."; exit 1; }

command -v x86_64-elf-gcc >/dev/null 2>&1 || { echo >&2 "I require x86_64-elf-gcc but it's not installed.  Aborting."; exit 1; }
command -v x86_64-elf-ld >/dev/null 2>&1 || { echo >&2 "I require x86_64-elf-ld but it's not installed.  Aborting."; exit 1; }

exit 0
