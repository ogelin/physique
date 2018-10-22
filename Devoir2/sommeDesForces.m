function [forces] = sommeDesForces(vitesse, vitesseAngulaire)
  forceGravite = forceGravite()
  forceMagnus = forceMagnus(vitesse, vitesseAngulaire)
  forceFrottementVisqueux = forceFrottementVisqueux(vitesse)
  %forceFrottementVisqueux = 0
  forces = forceGravite + forceMagnus + forceFrottementVisqueux
  fprintf("SOOOOOOOOMMMMEEE DES FORCES ************************");
endfunction
