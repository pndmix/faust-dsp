random = +(12345) ~ *(1103515245);
noise = random / 2147483647.0;

process = noise * vslider("Volume[style:knob]", 0, 0, 1, 0.1) <: _, _;