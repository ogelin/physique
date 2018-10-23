function [forces] = sommeDesForces(vitesse, vitesseAngulaire)
  forceGravite = forceGravite();
  forceMagnus = -forceMagnus(vitesse, vitesseAngulaire);
  forceFrottementVisqueux = forceFrottementVisqueux(vitesse);
  forces = forceGravite + forceMagnus + forceFrottementVisqueux;
endfunction
