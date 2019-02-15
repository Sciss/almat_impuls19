// example for sending out OSC messages
// we assume the target receives UDP at port 33333
// and understands the message /process <float> <float>
// ; for demo purposes we send the relative mouse coordinates

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress target;

void setup() {
  size(400, 400);
  frameRate(25);
  oscP5 = new OscP5(this, 33343); // use a different port for our own receiver
  target = new NetAddress("127.0.0.1", 33333);
}

void draw() {
  background(0);
}

void mouseMoved() {
  OscMessage m = new OscMessage("/processing");
  m.add((float) mouseX);
  m.add((float) mouseY);
  oscP5.send(m, target);
}
