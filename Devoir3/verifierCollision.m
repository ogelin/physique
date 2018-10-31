function collision = verifierCollision (positionCMBalle, positionCMBoite, thetaBoite)
  %Retourne Constantes.COUP_REUSSI (=1) si il y a collision entre 
  %la balle et la boite selon les positions données.
  %Sinon retourne Constantes.COUP_MANQUE (=0) s'il n'y a pas de collision
  
  positionCMBalleModif = matriceRotationY(thetaBoite)*positionCMBalle;
  positionCMBoiteModif = matriceRotationY(thetaBoite)*positionCMBoite;
  
  distZ = Constantes.HAUTEUR_BOITE_m/2 + Constantes.RAYON_BALLE_m;
  
  estDansBornesZ = (positionCMBalleModif(3) <= positionCMBoiteModif(3) + distZ) ...
                    && (positionCMBalleModif(3) >= positionCMBoiteModif(3) - distZ);
  
  estDansBornesXY = sqrt((positionCMBalleModif(1)-positionCMBoiteModif(1))^2 ...
                    + (positionCMBalleModif(2)-positionCMBoiteModif(2))^2) ...
                    <= Constantes.RAYON_BOITE_m+Constantes.RAYON_BALLE_m;

  if (estDansBornesXY && estDansBornesZ)
    collision = Constantes.COUP_REUSSI;
  else
    collision = Constantes.COUP_MANQUE;
  endif
endfunction
