

function [effetMagnus] = forceMagnus (vitesse, vitesseAngulaire)

p = 1.2754 # masse volumique de l'air en kg/m3

coefficientMagnus = coefficientMagnus(vitesse, vitesseAngulaire);

A = pi*(rayonBallon^2); # Aire effective du ballon

resultat = vitesse*vitesseAngulaire;

resultatDenominateur = calculNorme(resultat);

effetMagnus = p * coefficientMagnus * A * (vitesseNormee^2) * (vitesse * vitesseAngulaire)/resultatDenominateur);

endfunction
