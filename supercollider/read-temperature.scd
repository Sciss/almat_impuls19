// Returns a float:
// temperature in °C.
// Requires SunFounder Temperature Sensor DS18b20 connected to
// (GND, 3.3V, GPIO4), device tree overlay w1-gpio
// enabled, and modprobe w1-gpio, w1-therm loaded.
~readTemperature = {
	var pythonDir = "/home/pi/Documents/workshop/python/";
	var script = "read_ds18b20.py";
	var out = (pythonDir ++ script).unixCmdGetStdOut;
	out.asFloat;
};

t = ~readTemperature.();
