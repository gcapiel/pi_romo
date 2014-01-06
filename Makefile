OBJS=audio.o sinewave.o
BIN=hello_audio.bin
LDFLAGS+=-lilclient

include /opt/vc/src/hello_pi/Makefile.include

