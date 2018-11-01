function [j] = calculerImpulsion(vitesseCMBalle, vitesseCMBoite, rCMBalle, rCollision, wiBoite, thetaBoite)
  
  denominateur_j = 1/Constantes.MASSE_BALLE_kg + 1/Constantes.MASSE_BOITE_kg; 
  
  va = vitesseCMBalle; 
  
  vb = vitesseCMBoite + cross(wiBoite, rCollision);
  
  deltaV = va - vb;
  
  vecteurNormal = trouverVecteurNormal(rCMBalle, rCollision);
  
  vr_avant = dot(vecteurNormal, deltaV);
  
  numerateur_j = -vr_avant*(1+Constantes.COEFFICIENT_RESTITUTION);
  
  j = numerateur_j/denominateur_j;
  
  %QUESTION: Doit-on multiplier j par le vec normal?? 
  
endfunction
