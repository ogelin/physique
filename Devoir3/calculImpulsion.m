function [j] = calculerImpulsion(vitesseCMBalle, vitesseCMBoite, wiBoite, thetaBoite)
  
  denominateur_j = 1/Constantes.MASSE_BALLE_kg + 1/Constantes.MASSE_BOITE_kg; 
  
  
  
  vr_avant = [0,0,0]; %TODO
  
  numerateur_j = -vr_avant*(1+Constantes.COEFFICIENT_RESTITUTION);
  
  j = numerateur_j/denominateur_j;
  
endfunction
