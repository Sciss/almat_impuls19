
n = NetAddr("localhost", 57120);

OSCdef(\adcin,{|msg| msg.postln;}, '/adc0'); // reads only channel 1
OSCdef(\adcin).enable;


