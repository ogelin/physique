function collision = verifierCollision (positionCMBalle, positionCMBoite, thetaBoite)
  %Retourne Constantes.COUP_REUSSI (=1) si il y a collision entre 
  %la balle et la boite selon les positions données.
  %Sinon retourne Constantes.COUP_REUSSI (=0) s'il n'y a pas de collision
  
  positionCMBalleModif = matriceRotationY(thetaBoite)*positionCMBalle;
  positionCMBoiteModif = matriceRotationY(thetaBoite)*positionCMBoite;
  
  distZ = Constantes.HAUTEUR_BOITE_m/2 + Constantes.RAYON_BALLE_m/2;
  
  estDansBornesZ = (positionCMBalleModif(3) <= positionCMBoiteModif(3) + distZ) & (positionCMBalleModif(3) >= positionCMBoiteModif(3) - distZ);

endfunction
