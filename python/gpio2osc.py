#!/usr/bin/env python

import spidev
import time
import os
from OSC import OSCClient, OSCMessage
import RPi.GPIO as GPIO

# Open SPI bus
spi = spidev.SpiDev()
spi.open(0,0)

# Open osc

send_address = "localhost" , 57120
c = OSCClient()
c.connect(send_address)

# Function to read SPI data from MCP3008 chip
# Channel must be an integer 0-7
def ReadChannel(channel):
  adc = spi.xfer2([1,(8+channel)<<4,0])
  data = ((adc[1]&3) << 8) + adc[2]
  return data


# Define delay between readings
delay = 0.05

while True:

  c.send( OSCMessage("/adc0", ReadChannel(0)) )
  c.send( OSCMessage("/adc1", ReadChannel(1)) )
  c.send( OSCMessage("/adc2", ReadChannel(2)) )
  c.send( OSCMessage("/adc3", ReadChannel(3)) )
  c.send( OSCMessage("/adc4", ReadChannel(4)) )
  c.send( OSCMessage("/adc5", ReadChannel(5)) )
  c.send( OSCMessage("/adc6", ReadChannel(6)) )
  c.send( OSCMessage("/adc7", ReadChannel(7)) )
  
  time.sleep(delay)
