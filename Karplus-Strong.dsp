import("stdfaust.lib");
string = hgroup("String[0]", +~(de.fdelay4(maxDelLength, delLength-1) : filter : *(damping)))
with {
  freq = hslider("[0]freq", 440, 50, 5000, 1);
  damping = hslider("[1]Damping[style:knob]", 0.99, 0, 1, 0.01);
  maxDelLength = 960;
  filter = _ <: _,_' :> /(2);
  delLength = ma.SR / freq;
};
pluck = hgroup("[1]Pluck", gate : ba.impulsify * gain)
with {
  gain = hslider("gain[style:knob]", 1, 0, 1, 0.01);
  gate = button("gate");
};
process = vgroup("Karplus Strong", pluck : string);
