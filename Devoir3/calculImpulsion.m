function [j] = calculImpulsion(vitesseCMBalle, vitesseCMBoite, rCMBoite, rCollision, wiBoite, normaleBalle)
  
  denominateur_j = 1/Constantes.MASSE_BALLE_kg + 1/Constantes.MASSE_BOITE_kg;
  
  va = vitesseCMBalle;
 
  distCMBoiteCollision = rCollision - rCMBoite;
  vb = vitesseCMBoite + cross(wiBoite, distCMBoiteCollision);
  
  deltaV = normaleBalle .* (va - vb);
    
  %numerateur_j = -vr_avant*(1+Constantes.COEFFICIENT_RESTITUTION);
  
  numerateur_j = -deltaV*(1+Constantes.COEFFICIENT_RESTITUTION);

  j = numerateur_j/denominateur_j;
  
  
  
  
endfunction
