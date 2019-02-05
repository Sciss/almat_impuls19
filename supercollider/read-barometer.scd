// Returns an array with two floats:
// [temperature in °C, pressure in Pa].
// Requires SunFounder Barometer BMP180 connected to
// (GND, 3.3V, SDA, SDL), I2C enabled ~readBarometer
~readBarometer = {
	var pythonDir = "/home/pi/Documents/workshop/python/";
	var script = "read_bmp180.py";
	var out = (pythonDir ++ script).unixCmdGetStdOut.split($ );
	out.asFloat;
};

#t, p = ~readBarometer.();
