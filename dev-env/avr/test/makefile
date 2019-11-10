
HEX := blink.hex

$(HEX): blink.c
	./build.sh


program:
	avrdude -P usb -c usbtiny -p m168 -U flash:w:$(HEX)


.PHONY: clean

clean:
	rm -f $(HEX)
