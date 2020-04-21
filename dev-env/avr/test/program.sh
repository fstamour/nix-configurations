#!/usr/bin/env bash
set -x

avrdude -P usb -c usbtiny -p m168 -U flash:w:blink.hex


