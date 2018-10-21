

function [cVis] = calculCoefficientTraineeVisqueuse (vitesseNormee)

nombreReynolds = calculNombreReynolds(vitesseNormee);

if(nombreReynolds < 100000)

cVis = 0.235 * vitesseNormee;

elseif(100000 <= nombreReynolds < 135000)

cVis = 0.235 * vitesseNormee - (0.125 * vitesseNormee * ((nombreReynolds - 100000)/35000));

elseif(135000 <= nombreReynolds)

cVis = 0.110 * vitesseNormee;

else

disp('Problème avec la fonction calculCoefficientTraineeVisqueuse');

endif
endfunction
