function intensite = calculerIntensiteSonoreSelonDistance(r, v)
  intensite = 160 - 20*log(0/100)-calculerA_v(v)*-100;
endfunction
