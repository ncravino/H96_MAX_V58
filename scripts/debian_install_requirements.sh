#!/usr/bin/bash

set -e 

# for building rkflashtool
apt install libusb-1.0-0-dev 

# for processing image
apt install abootimg mkbootimg