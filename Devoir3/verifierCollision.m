function collision = verifierCollision (positionCMBalle, positionCMBoite, thetaBoite)
  %Retourne Constantes.COUP_REUSSI (=1) si il y a collision entre 
  %la balle et la boite selon les positions donn�es.
  %Sinon retourne Constantes.COUP_MANQUE (=0) s'il n'y a pas de collision
  
  %Rotation du syst�me d'axes
  positionCMBalleModif = matriceRotationY(thetaBoite)*transpose(positionCMBalle);
  positionCMBoiteModif = matriceRotationY(thetaBoite)*transpose(positionCMBoite);
  
  %V�rification des bornes d'en haut et d'en bas du cylindre
  distZ = Constantes.HAUTEUR_BOITE_m/2 + Constantes.RAYON_BALLE_m;
  
  estDansBornesZ = (positionCMBalleModif(3) <= positionCMBoiteModif(3) + distZ) ...
                    && (positionCMBalleModif(3) >= positionCMBoiteModif(3) - distZ);
  
  %V�rification des bornes du cercle
  estDansBornesXY = sqrt((positionCMBalleModif(1)-positionCMBoiteModif(1))^2 ...
                    + (positionCMBalleModif(2)-positionCMBoiteModif(2))^2) ...
                    <= Constantes.RAYON_BOITE_m+Constantes.RAYON_BALLE_m;
                    
  %V�rification de la distance des CM 
  distanceCMAcceptable = sqrt((positionCMBalleModif(1)-positionCMBoiteModif(1))^2 ...
                    + (positionCMBalleModif(2)-positionCMBoiteModif(2))^2 ...
                    + (positionCMBalleModif(3)-positionCMBoiteModif(3))^2) ...
                    <= sqrt((Constantes.HAUTEUR_BOITE_m/2)^2 + ...
                    (Constantes.RAYON_BOITE_m)^2) + Constantes.RAYON_BALLE_m;
                    
  if (estDansBornesXY && estDansBornesZ && distanceCMAcceptable)
    collision = Constantes.COUP_REUSSI;
  else
    collision = Constantes.COUP_MANQUE;
  endif
endfunction
