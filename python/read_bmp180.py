#!/usr/bin/env python
#---------------------------------------------------------
#
#		This is a program for Barometer Pressure Sensor
#	Module. It could measure the pressure and temperature.
#
#		This program depend on BMP085.py writted by 
#	Adafruit. 
#
#	   Barometer Module			   Pi
#			VCC ----------------- 3.3V
#			GND ------------------ GND
#			SCL ----------------- SCL1
#			SDA ----------------- SDA1
#
#---------------------------------------------------------
import Adafruit_BMP.BMP085 as BMP085
import time
import RPi.GPIO as GPIO

def sample():
	sensor = BMP085.BMP085()
	temp = sensor.read_temperature()	# Read temperature to veriable temp
	pressure = sensor.read_pressure()	# Read pressure to veriable pressure
	print '{0:0.2f} {1:0.2f}'.format(temp, pressure)

def destroy():
	GPIO.cleanup()				# Release resource

if __name__ == '__main__':		# Program start from here
	try:
		sample()
	finally:
		# destroy()
                pass
