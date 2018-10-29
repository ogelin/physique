function momentInertie = calculMomentInertieBoite()
  momentInertie = (Constantes.MASSE_BOITE_kg*Constantes.RAYON_BOITE_m^2)/2 + (Constantes.MASSE_BOITE_kg*Constantes.HAUTEUR_BOITE_m^2)/12
endfunction
