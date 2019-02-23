k = 32;

(
x = play {
	var in = In.ar(NumOutputBuses.ir, 1);
	var sz = 1024;
	var fft = FFT(LocalBuf(sz), in);
	var mfcc = MFCC.kr(fft, numcoeff: k + 1);
	SendReply.kr(Impulse.kr(SampleRate.ir / sz), values: mfcc);
	0
};
)

(
w = Window.new("MFCC", Rect(0, 0, k*13+2 + 8,300 + 8));
m = MultiSliderView(w,Rect(4,4,k*13+2,300)); //default thumbWidth is 13
m.value=Array.fill(k, 0);
m.editable = false;
m.drawLines = true;
m.drawRects = false;
w.alwaysOnTop = true;
w.front;
)

o = OSCFunc({ |msg| var v = msg.drop(4); /* v.postln; */ defer { m.value = v; }}, '/reply');
o.free();
