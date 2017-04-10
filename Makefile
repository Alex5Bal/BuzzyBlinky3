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
BlinkyBuzzy.elf: ${COMMON_OBJECTS} main.o led.o buzzer.o stateMachines.o switches.o wdInterruptHandler.o p1InterruptHandler.o ../lib/libTimer.a
	${CC} $(CFLAGS) $^ $(LDFLAGS) -o $@

load: BlinkBuzzy.elf
	mspdebug rf2500 "prog BlinkyBuzzy.elf"
clean:
	rm -f *.o *.elf


main.o: buzzer.h led.h switches.h
led.o: led.h switches.h
buzzer.c: buzzer.h switches.h
wdInterruptHandler.o: buzzer.h led.h
p1InterruptHandler.o: switches.h
