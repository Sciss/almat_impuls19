// Returns an array with two ints:
// [humidity in %, temperature in °C].
// Requires SunFounder Humiture DHT11 connected to
// (GND, 3.3V, GPIO17).
~readHumiture = {
	var pythonDir = "/home/pi/Documents/workshop/python/";
	var script = "read_dht11.py";
	var out = (pythonDir ++ script).unixCmdGetStdOut.split($ );
	out.asInt;
};

#h, t = ~readHumiture.();
