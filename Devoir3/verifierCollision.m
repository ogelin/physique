function collision = verifierCollision (positionCMBalle, positionCMBoite, thetaBoite)
  %Retourne Constantes.COUP_REUSSI (=1) si il y a collision entre 
  %la balle et la boite selon les positions données.
  %Sinon retourne Constantes.COUP_MANQUE (=0) s'il n'y a pas de collision
  
  %Rotation du système d'axes
  positionCMBalleModif = matriceRotationY(thetaBoite)*transpose(positionCMBalle);
  positionCMBoiteModif = matriceRotationY(thetaBoite)*transpose(positionCMBoite);
  
  %Vérification des bornes d'en haut et d'en bas du cylindre
  distZ = Constantes.HAUTEUR_BOITE_m/2 + Constantes.RAYON_BALLE_m;
  
  estDansBornesZ = (positionCMBalleModif(3) <= positionCMBoiteModif(3) + distZ) ...
                    && (positionCMBalleModif(3) >= positionCMBoiteModif(3) - distZ);
  
  %Vérification des bornes du cercle a la base du cylindre
  
  distanceCMEtBaseCylindre = sqrt((positionCMBalleModif(1)-positionCMBoiteModif(1))^2 ...
                    + (positionCMBalleModif(2)-positionCMBoiteModif(2))^2);
                    
  estDansBornesXY = distanceCMEtBaseCylindre ...
                    <= Constantes.RAYON_BOITE_m+Constantes.RAYON_BALLE_m;
                    
  distanceActuelleDesCM =  sqrt((positionCMBalleModif(1)-positionCMBoiteModif(1))^2 ...
                    + (positionCMBalleModif(2)-positionCMBoiteModif(2))^2 ...
                    + (positionCMBalleModif(3)-positionCMBoiteModif(3))^2);
                    
  maxDistanceDesCMQuandCollision =  sqrt((Constantes.HAUTEUR_BOITE_m/2)^2 + ...
                    (Constantes.RAYON_BOITE_m)^2) + Constantes.RAYON_BALLE_m;
  
if(positionCMBalle(1) > 2.5 && positionCMBalle(1) < 3.09) 
  %disp(thetaBoite); 
  %printf("Balle\n");
  %disp(positionCMBalle);
  %disp(positionCMBalleModif);
  %printf("Boite\n");
  %disp(positionCMBoite);
  %disp(positionCMBoiteModif);
  printf("MaxDistCM : ");
  disp(maxDistanceDesCMQuandCollision);
  printf("DistanceActuelle : ");
  disp(distanceActuelleDesCM);
            
endif

  %Vérification de la distance des CM 
  distanceCMAcceptable = distanceActuelleDesCM <=  maxDistanceDesCMQuandCollision;
                    
  if (estDansBornesXY && estDansBornesZ && distanceCMAcceptable)
    
    %On sait qu'on a une collision, alors on verifie de quel type...
    
    if (distanceActuelleDesCM == maxDistanceDesCMQuandCollision)
      %L'arete est a la distance max entre le CM du cylindre et de la sphere
      collision = Constantes.COLLISION_ARETE;
    
    elseif(positionCMBalleModif(3)<positionCMBoiteModif(3) + distZ...
    && positionCMBalleModif(3)>positionCMBoiteModif(3) + distZ)
      %Si la collision se fait à une hauteur entre les deux bases elle
      %se fait avec le rebord vertical du cylindre
      collision = Constantes.COLLISION_COTE;
  
    else
      %Si la collision n'est pas avec une arête ou un côté vertical, 
      %on peut déduire qu'elle est avec une des bases circulaires
      collision = Constantes.COLLISION_BASE;
    endif
  else
    %Pas de collision
    collision = Constantes.COUP_MANQUE;
  endif
endfunction 
