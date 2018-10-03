

function [nombreReynolds] = calculNombreReynolds (vitesseNormee)

p = 1.2754 # masse volumique de l'air en kg/m3

viscositeAirU = 1.8*10^-5; # En kg/ms (lettre grec mu)

rayonBallon = 0.11;

nombreReynolds = (p*vitesseNormee*rayonBallon)/viscositeAirU;

endfunction
