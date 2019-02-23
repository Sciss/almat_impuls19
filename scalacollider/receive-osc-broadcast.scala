val cfg = osc.UDP.Config()
cfg.localPort = 0x496d
val rcv = osc.UDP.Receiver(cfg)
rcv.action = {
  case (osc.Message("/data31", f: Float), _) =>
    println(s"data: $f")
}
rcv.connect()
// rcv.dump()
// rcv.dump(osc.Dump.Off)
