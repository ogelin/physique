

function [forceVisqueux] = forceFrottementVisqueux (vitesse)

rayonBallon = 0.11;

A = pi*(rayonBallon^2); # Aire effective du ballon

p = 1.2754 # masse volumique de l'air en kg/m3

vitesseNorme = calculNorme(vitesse);

nombreReynolds = calculNombreReynolds(vitesseNorme);

cVis = calculCoefficientTraineeVisqueuse(vitesseNormee);

forceVisqueux = -A * p * cVisqueux * vitesseNorme * vitesse;

endfunction
