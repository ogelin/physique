function intensite = calculerIntensiteSonoreSelonDistance(r, v)
  r;
  a = 20*log10(r/100);
  b = calculerA_v(v)*(r-100);
  intensite = 160 - a - b;
endfunction
