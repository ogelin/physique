

function [forceVisqueuse] = forceFrottementVisqueux(vitesse)

rayonBallon = 0.11;

A = pi*(rayonBallon^2); # Aire effective du ballon

p = 1.2754 # masse volumique de l'air en kg/m3

vitesseNormee = calculNorme(vitesse);

cVis = calculCoefficientTraineeVisqueuse(vitesseNormee);

forceVisqueuse = -A * p * cVis * vitesse;
 
endfunction
