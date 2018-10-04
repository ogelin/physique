

function [forceVisqueuse] = forceFrottementVisqueux(vitesse)

printf('vitesse visqueux');
disp(vitesse);

rayonBallon = 0.11;

A = pi*(rayonBallon^2); # Aire effective du ballon

p = 1.2754 # masse volumique de l'air en kg/m3

vitesseNormee = calculNorme(vitesse);

nombreReynolds = calculNombreReynolds(vitesseNormee);

cVis = calculCoefficientTraineeVisqueuse(vitesseNormee);

forceVisqueuse = -A * p * cVis * vitesseNormee * vitesse;
forceVisqueuse = A+p;
 
endfunction
