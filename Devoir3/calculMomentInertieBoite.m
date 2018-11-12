function [mI] = calculMomentInertieBoite(theta, positionCMBoite)
       
       ix = ((Constantes.MASSE_BOITE_kg/2)*(Constantes.RAYON_BOITE_m^2))+...
       ((Constantes.MASSE_BOITE_kg/12)*(Constantes.HAUTEUR_BOITE_m^2));
       iy = ((Constantes.MASSE_BOITE_kg/2)*(Constantes.RAYON_BOITE_m^2))+...
       ((Constantes.MASSE_BOITE_kg/12)*(Constantes.HAUTEUR_BOITE_m^2));
       iz = (Constantes.MASSE_BOITE_kg)*(Constantes.RAYON_BOITE_m^2);       
       
       %On obtient le MI selon le CM de la boite
       mISelonCMBoite = [ix,0,0;0,iy,0;0,0,iz];
       
       %Puisque la boite a une rotation et une translation, on veut rapporter
       %le MI selon l'origine...
        
       % TRANSLATION du MI vers l'origine, c-a-d (0,0,0): 
       dc = [0,0,0] - positionCMBoite; %dc = d - CM (ch.2 p.73)
      
       mIOrigine = mISelonCMBoite + (Constantes.MASSE_BOITE_kg*...
       [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
       (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
       (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);   
    
       % ROTATION du MI pour prendre en compte la rotation du cylindre: 
       
       %On rotate dans le sens inverse pour remettre dans le système 
       % d'axes de l'observateur 
       
       matriceRotation = matriceRotationY(-theta);
       
       miOrigineCorrige = matriceRotation *... % MI' = (R_2<-1)*(MI)*((R_2<-1)^T)
                          mIOrigine * ...
                          transpose(matriceRotation);
       
       mI = miOrigineCorrige;
           
endfunction
