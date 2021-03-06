function collision = verifierCollision (positionCMBalle, positionCMBoite, thetaBoite)
  %Retourne Constantes.COUP_REUSSI (=1) si il y a collision entre 
  %la balle et la boite selon les positions donn�es.
  %Sinon retourne Constantes.COUP_MANQUE (=0) s'il n'y a pas de collision
  
  %Rotation du syst�me d'axes
  positionCMBalleModif = matriceRotationY(thetaBoite)*transpose(positionCMBalle);
  positionCMBoiteModif = matriceRotationY(thetaBoite)*transpose(positionCMBoite);
  
  %V�rification des bornes d'en haut et d'en bas du cylindre
  distZ = Constantes.HAUTEUR_BOITE_m/2 + Constantes.RAYON_BALLE_m;
  
  distanceCMBoiteBalleZ = sqrt((positionCMBalleModif(3) - positionCMBoiteModif(3))^2);
  
  estDansBornesZ = ( distanceCMBoiteBalleZ <= distZ + Constantes.PRECISION_VOULUE);
  
  %V�rification des bornes du cercle a la base du cylindre
  
  distanceCMEtBaseCylindre = sqrt((positionCMBalleModif(1)-positionCMBoiteModif(1))^2 ...
                    + (positionCMBalleModif(2)-positionCMBoiteModif(2))^2);
                    
  maxDistanceDesCMXY = Constantes.RAYON_BOITE_m+Constantes.RAYON_BALLE_m;
                    
  estDansBornesXY = distanceCMEtBaseCylindre ...
                    <= maxDistanceDesCMXY + Constantes.PRECISION_VOULUE;
                    
  distanceActuelleDesCM =  sqrt((positionCMBalleModif(1)-positionCMBoiteModif(1))^2 ...
                    + (positionCMBalleModif(2)-positionCMBoiteModif(2))^2 ...
                    + (positionCMBalleModif(3)-positionCMBoiteModif(3))^2);
                    
  maxDistanceDesCMQuandCollision =  sqrt((Constantes.HAUTEUR_BOITE_m/2)^2 + ...
                    (Constantes.RAYON_BOITE_m)^2) + Constantes.RAYON_BALLE_m;
  

  %V�rification de la distance des CM 
  distanceCMAcceptable = distanceActuelleDesCM <=  maxDistanceDesCMQuandCollision...
                                               + Constantes.PRECISION_VOULUE;
                    
  if (estDansBornesXY && estDansBornesZ && distanceCMAcceptable)
    
    %On sait qu'on a une collision, alors on verifie de quel type...
    
    if (distanceCMEtBaseCylindre < maxDistanceDesCMXY - Constantes.PRECISION_VOULUE/2 ...
      && distanceCMBoiteBalleZ > distZ - Constantes.PRECISION_VOULUE...
      && distanceCMBoiteBalleZ < distZ + Constantes.PRECISION_VOULUE)
      %L'arete est a la distance max entre le CM du cylindre et de la sphere
      collision = Constantes.COLLISION_BASE;
    
    elseif(positionCMBalleModif(3)<positionCMBoiteModif(3) + distZ + Constantes.PRECISION_VOULUE...
    && positionCMBalleModif(3)>positionCMBoiteModif(3) - distZ - Constantes.PRECISION_VOULUE)
      %Si la collision se fait � une hauteur entre les deux bases elle
      %se fait avec le rebord vertical du cylindre
      collision = Constantes.COLLISION_COTE;
  
    else
      %Si la collision n'est pas avec une ar�te ou un c�t� vertical, 
      %on peut d�duire qu'elle est avec une des bases circulaires
      collision = Constantes.COLLISION_ARETE;
    endif
  else
    %Pas de collision
    collision = Constantes.COUP_MANQUE;
  endif
endfunction 
