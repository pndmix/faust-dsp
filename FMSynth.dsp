import("stdfaust.lib");
harmFm(cFreq, hRatio, idx) = os.osc(cFreq + os.osc(cFreq*hRatio)*idx*hRatio);
fm = hgroup("[0]FM", harmFm(carFreq, harmRatio, index))
with {
  harmRatio = hslider("Modulator Frequency", 20, 0.1, 2000, 0.01);
  index = hslider("Modulation Index", 100, 0, 1000, 0.01);
  carFreq = hslider("freq", 440, 50, 2000, 0.01);
};
envelope = hgroup("[1]Envelope", en.adsr(attack, decay, sustain, release, gate) * gain)
with {
  attack = hslider("[0]Attack[style:knob]", 50, 1, 1000, 1) * 0.001;
  decay = hslider("[1]Decay[style:knob]", 50, 1, 1000, 1) * 0.001;
  sustain = hslider("[2]Sustain[style:knob]", 0.8, 0.01, 1, 1);
  release = hslider("[3]Release[style:knob]", 50, 1, 1000, 1) * 0.001;
  gain = hslider("[4]gain[style:knob]", 1, 0, 1, 0.01);
  gate = button("[5]gate");
};
process = vgroup("FM Synthesizer", fm * envelope);
			