function [forces] = sommeDesForces(vitesse, vitesseAngulaire)
  forceGravite = forceGravite();
  forceMagnus = forceMagnus(vitesse, vitesseAngulaire);
  printf('vitesse:');
  disp(vitesse);
  forceFrottementVisqueux(vitesse);
  forces = forceGravite + forceMagnus + forceFrottementVisqueux;
endfunction
