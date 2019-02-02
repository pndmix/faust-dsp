import("stdfaust.lib");
envelope = en.adsr(attack, decay, sustain, release, gate) * gain
  with {
    attack = hslider("Attack", 50, 1, 1000, 1) * 0.001;
    decay = hslider("Decay", 50, 1, 1000, 1) * 0.001;
    sustain = hslider("Sustain", 0.8, 0.01, 1, 1);
    release = hslider("Release", 50, 1, 1000, 1) * 0.001;
    gain = hslider("gain", 1, 0, 1, 0.001);
    gate = button("gate");
  };
waveGenerator = os.osc(freq), os.triangle(freq), os.square(freq), os.sawtooth(freq) : ba.selectn(4, wave)
  with {
    wave = nentry("Waveform", 0, 0, 3, 1);
    freq = hslider("freq", 440, 50, 2000, 0.01);
  };
process = waveGenerator * envelope;