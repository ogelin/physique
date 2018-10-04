function [forces] = sommeDesForces(vitesse, vitesseAngulaire)
  forceGravite = forceGravite();
  forceMagnus = forceMagnus(vitesse, vitesseAngulaire);
  forceFrottementVisqueux(vitesse);
  forces = forceGravite + forceMagnus + forceFrottementVisqueux;
endfunction
