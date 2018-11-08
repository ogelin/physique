function [vecteurNormalCylindre, vecteurNormalBalle] = trouverVecteurNormal(rCMBalle, rCMBoite, thetaBoite, typeCollision)
      
    %rotation du système d'axes
    positionCMBalleModif = matriceRotationY(thetaBoite)*transpose(rCMBalle);
    positionCMBoiteModif = matriceRotationY(thetaBoite)*transpose(rCMBoite);
    
 %CAS 1: La balle entre en collision avec le cercle en haut ou en bas du cylindre
    if(typeCollision==Constantes.COLLISION_BASE)
      if (rCMBalle(3)>=positionCMBoiteModif(3) + Constantes.HAUTEUR_BOITE_m/2)
        %collision avec la base circulaire de haut
        pointCollision = rCMBalle-[0,0,Constantes.RAYON_BALLE_m];
      else
        %collision avec la base circulaire du bas
        pointCollision = rCMBalle+[0,0,Constantes.RAYON_BALLE_m];
      endif
      vecteurNormalBalle = rCMBalle-pointCollision;
      vecteurNormalCylindre = -vecteurNormalBalle;
 
 %CAS 2: La balle entre en collision avec le côté vertical du cylindre
    elseif(typeCollision==Constantes.COLLISION_COTE)
    %on fait le meme calcul peut importe la direction d'arrivée de la balle
      direction = [positionCMBalleModif(1)-positionCMBoiteModif(1),...
                   positionCMBalleModif(2)-positionCMBoiteModif(2), ...
                   positionCMBalleModif(3)];
      %on ne se préoccupe pas de la longueur du vecteur puisqu'on retourne
      % un vecteur unitaire à la fin du calcul
      vecteurNormalBalle = direction;
      vecteurNormalCylindre = - vecteurNormalBalle;
    
  %CAS 3: La balle entre en collision avec l'arête entre le cercle et le côté
    elseif(typeCollision==Constantes.COLLISION_ARETE)
    %.............TODO.............
    
  endif
  
   %retour au système d'axes global  
    vecteurNormalBalle = matriceRotationY(-thetaBoite)*transpose(vecteurNormalBalle);
    vecteurNormalCylindre = matriceRotationY(-thetaBoite)*transpose(vecteurNormalCylindre);
    

    %rendre les vecteurs unitaires en divisant par la norme
    vecteurNormalBalle = vecteurNormalBalle / sqrt(vecteurNormalBalle(1)^2+vecteurNormalBalle(2)^2+vecteurNormalBalle(3)^2); 
    vecteurNormalCylindre = vecteurNormalCylindre / sqrt(vecteurNormalCylindre(1)^2+vecteurNormalCylindre(2)^2+vecteurNormalCylindre(3)^2); 
endfunction
