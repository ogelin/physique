function [vecteurNormalCylindre, vecteurNormalBalle] = trouverVecteurNormal(rCMBalle, rCMBoite, theta, typeCollision)
    
    
    %rotation du système d'axes
    positionCMBalleModif = matriceRotationY(thetaBoite)*transpose(rCMBalle);
    positionCMBoiteModif = matriceRotationY(thetaBoite)*transpose(rCMBoite);
          
    if(typeCollision==Constantes.COLLISION_BASE)
      if (rCMBalle(3)=>positionCMBoiteModif(3) + Constantes.HAUTEUR_BOITE_m/2)
        %collision avec la base circulaire de haut
        pointCollision = rCMBalle-[0,0,Constantes.RAYON_BALLE_m];
      else
        %collision avec la base circulaire du bas
        pointCollision = rCMBalle+[0,0,Constantes.RAYON_BALLE_m];
      endif
      vecteurNormalBalle = rCMBalle-pointCollision;
      vecteurNormalCylindre = -vecteurNormalBalle;
      
    elseif(typeCollision==Constantes.COLLISION_COTE)
    
    elseif(typeCollision==Constantes.COLLISION_ARETE)
    
  endif
  
   %retour au système d'axes global  
    vecteurNormalBalle = matriceRotationY(-thetaBoite)*vecteurNormalBalle;
    vecteurNormalCylindre = matriceRotationY(-thetaBoite)*vecteurNormalCylindre;

    %rendre les vecteurs unitaires en divisant par la norme
    vecteurNormalBalle = vecteurNormalBalle / sqrt(vecteurNormalBalle(1)^2+vecteurNormalBalle(2)^2+vecteurNormalBalle(3)^2); 
    vecteurNormalCylindre = vecteurNormalCylindre / sqrt(vecteurNormalCylindre(1)^2+vecteurNormalCylindre(2)^2+vecteurNormalCylindre(3)^2); 
endfunction
