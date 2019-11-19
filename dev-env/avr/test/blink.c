// Toggling Pin0 of PortD (PD0) every second on ATmega48/88/168/328

#include <avr/io.h>
#include <avr/interrupt.h>

int main(void) {
	cli(); // Disable interrupts
	// Setup the clock
	TCCR1B |= 1 << CS11 | 1 << CS10;
	// Number of cycles between interrupts (this is about 1 second with a 16MHz clock).
	OCR1A = 15624; 
	// Put timer 1 in CTC (clear on timer) mode
	TCCR1B |= 1 << WGM12;
	// Enable timer 1's interrupt
	TIMSK1 |= 1 << OCIE1A;
	sei(); // Enable interrupts

	// Setup I/O
	// Set the pin 0 of port D as an output.
	DDRD |= (1 << 0);
	// Set the very same pin high.
	PORTD |= (1 << 0);

	while(1);
}

ISR(TIMER1_COMPA_vect) {
	// Toggle pin 0 of port D
	PORTD ^= (1<<0);
}

