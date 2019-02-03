import("stdfaust.lib");
echo = vgroup("Echo", +~(@(delLength) : *(feedback)))
with {
  duration = hslider("[0]Duration", 500, 1, 1000, 1) * 0.001;
  feedback = hslider("[1]Feedback", 0.5, 0, 1, 0.01);
  delLength = ma.SR * duration;
};
process = echo;