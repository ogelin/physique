

function [coefficientMagnus] = calculCoefficientMagnus (vitesse, vitesseAngulaire)

rayonBallon = 0.11;

coefficientMagnus = 0.1925 * ((vitesseAngulaire * rayonBallon)/vitesse)^0.25

endfunction
