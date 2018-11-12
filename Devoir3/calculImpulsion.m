function [j] = calculImpulsion(vitesseCMBalle, vitesseCMBoite, rCMBoite, rCollision, wiBoite, thetaBoite, typeCollision, normaleBalle)
  
  denominateur_j = 1/Constantes.MASSE_BALLE_kg + 1/Constantes.MASSE_BOITE_kg;
  
  va = vitesseCMBalle;
 
  distCMBoiteCollision = rCollision - rCMBoite;
  vb = vitesseCMBoite + cross(transpose(wiBoite), distCMBoiteCollision);
  
  deltaV = transpose(normaleBalle) .* (va - vb);
    
  %vr_avant = dot(vecteurNormal, deltaV);
  
  %numerateur_j = -vr_avant*(1+Constantes.COEFFICIENT_RESTITUTION);
  
  numerateur_j = -deltaV*(1+Constantes.COEFFICIENT_RESTITUTION);

  j = numerateur_j/denominateur_j;
  
  %QUESTION: Doit-on multiplier j par le vec normal?? 
  
  
  
endfunction
