function [vecteurNormal] = trouverVecteurNormal(rCMBalle, rCMBoite, theta, typeCollision)
    
    %rotation du système d'axes
    positionCMBalleModif = matriceRotationY(thetaBoite)*transpose(rCMBalle);
    positionCMBoiteModif = matriceRotationY(thetaBoite)*transpose(rCMBoite);
    
    vecteurNormalModif = [0,0,0]; %TODO
      
    if(typeCollision==Constantes.COLLISION_BASE)
      
    
    elseif(typeCollision==Constantes.COLLISION_COTE)
    
    elseif(typeCollision==Constantes.COLLISION_ARETE)
    
  endif
  
   %retour au système d'axes global
    
    vecteurNormal = matriceRotationY(-thetaBoite)*vecteurNormalModif;
    
    vecteurNormal = vecteurNormal / sqrt(vecteurNormal(1)^2+vecteurNormal(2)^2+vecteurNormal(3)^2); %rendre le vecteur unitaire en divisant par la norme
endfunction
