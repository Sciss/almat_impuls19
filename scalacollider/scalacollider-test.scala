val x = play {
  val tr   = Impulse.ar(2)
  val st   = Stepper.ar(tr, lo = 0, hi = 4)
  val stc  = st.min(3)
  val freq = stc.linLin(0, 3, 72, 78).midiCps
  val amp  = "amp".kr(-12.dbAmp) * (st sig_== stc)
  val env  = EnvGen.ar(Env.linen(0.02, 0.46, 0.02), gate = tr)
  val osc  = SinOsc.ar(freq) * amp * env
  Out.ar(stc, osc)
}

x.free()

