

function [coefficientMagnus] = calculCoefficientMagnus (vitesse, vitesseAngulaire)

rayonBallon = 0.11;

vitesseNorme = calculNorme(vitesse);

vitesseAngulaireNorme = calculNorme(vitesseAngulaire);

coefficientMagnus = 0.1925 * ((vitesseAngulaireNorme * rayonBallon)/vitesseNorme)^0.25

endfunction
