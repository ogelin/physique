function [mI] = calculMomentInertieBoite(theta, positionCMBoite)
       ix = ((Constantes.MASSE_BOITE_kg/4)*(Constantes.RAYON_BOITE_m^2))+((Constantes.MASSE_BOITE_kg/12)*(Constantes.HAUTEUR_BOITE_m^2));
       iy = ((Constantes.MASSE_BOITE_kg/4)*(Constantes.RAYON_BOITE_m^2))+((Constantes.MASSE_BOITE_kg/12)*(Constantes.HAUTEUR_BOITE_m^2));
       iz = (Constantes.MASSE_BOITE_kg/2)*(Constantes.RAYON_BOITE_m^2);
       
       mI = [ix,0,0;0,iy,0;0,0,iz];
       
       
endfunction
