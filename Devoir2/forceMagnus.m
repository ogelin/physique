

function [effetMagnus] = forceMagnus (vitesse, vitesseAngulaire)

p = 1.2754 # masse volumique de l'air en kg/m3

coefficientMagnus = calculCoefficientMagnus(vitesse, vitesseAngulaire);

ballonRayon = 0.11; # en mètre

A = pi*(ballonRayon^2); # Aire effective du ballon

resultat = cross(vitesse,vitesseAngulaire);

resultatDenominateur = calculNorme(resultat);

vitesseNorme = calculNorme(vitesse);

effetMagnus = p * coefficientMagnus * A * (vitesseNorme^2) * ((cross(vitesse,vitesseAngulaire))/resultatDenominateur);

endfunction
