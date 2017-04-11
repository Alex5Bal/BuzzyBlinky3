# makefile configuration
COMMON_OBJECTS  =
CPU             = msp430g2553
CFLAGS          = -mmcu=${CPU} -I../h
LDFLAGS = ../lib/libTimer.a -L/opt/ti/msp430_gcc/include

#switch the compiler (for the internal make rules)
CC              = msp430-elf-gcc
AS              = msp430-elf-as

all: BlinkyBuzzy.elf

#additional rules for files
BlinkyBuzzy.elf: ${COMMON_OBJECTS} main.o led.o buzzer.o stateMachines.o wdInterruptHandler.o ../lib/libTimer.a
	${CC} $(CFLAGS) $^ $(LDFLAGS) -o $@

load: BlinkBuzzy.elf
	mspdebug rf2500 "prog BlinkyBuzzy.elf"
clean:
	rm -f *.o *.elf


main.o: buzzer.h led.h stateMachines.o
led.o: led.h stateMachines.o
buzzer.c: buzzer.h
wdInterruptHandler.o: buzzer.h led.h
