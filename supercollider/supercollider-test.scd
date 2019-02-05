s.options.numInputBusChannels  = 2;
s.options.numOutputBusChannels = 4;
s.reboot;

x = play {
	var tr   = Impulse.ar(2);
	var st   = Stepper.ar(tr, min: 0, max: 4);
	var stc  = st.min(3);
	var freq = stc.linlin(0, 3, 72, 78).midicps;
	var amp  = \amp.kr(-12.dbamp) * (st < 4);
	var env  = EnvGen.ar(Env.linen(0.02, 0.46, 0.02), gate: tr);
	var osc  = SinOsc.ar(freq) * amp * env;
	Out.ar(stc, osc);
};

x.free;
