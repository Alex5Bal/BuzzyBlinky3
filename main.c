#include <msp430.h>
#include <libTimer.h>
#include "buzzer.h"		/* for setPeriod */
#include "led.h"		/* for led_control() */

int
main()
{
    configureClocks();		/* setup master oscillator, CPU & peripheral clocks */
    enableWDTInterrupts();	/* enable wd timer */
    or_sr(0x18);		/* CPU off, GIE on */
    
    buzzer_init();
    led_init();
}









