function [Coup tf vbaf vbof wbof rbaf rbof ]=Devoir3(vbal,wboi,tl)

  t = 0;
  deltaT = 0.01;
  
  %Code temporaire
  %Valeurs de retour du programme
  Coup = 0;
  tf = 0;
  vbaf = transpose([0,0,0;0,0,0]);
  vbof = transpose([0,0,0;0,0,0]);
  wbof = [0,0,0];
  rbaf = [0,0,0];
  rbof = [0,0,0];
  
  %Init parametres de la boite
  viBoite = [0,0,0];
  wiBoite = wboi;
  rBoite = Constantes.POSITION_INITIALE_BOITE_m;
  qBoite = q(viBoite, rBoite, wiBoite);
  
  %Init parametres de la balle
  viBalle = vbal;
  wiBalle = [0,0,0];
  rBalle = Constantes.POSITION_INITIALE_BALLE_m;
  qBalle = q(viBalle, rBalle, wiBalle);
  
  %Pour l'instant la simulation s'arrete quand la boite touche le sol
  while (rBoite(3)>Constantes.HAUTEUR_BOITE/2)

    qBoite = SEDRK4t0(qBoite,t,deltaT, 'g', Constantes.MASSE_BOITE_kg);
    rBoite = [qBoite(4), qBoite(5), qBoite(6)]
    theta = wiBoite*deltaT;
    
    
    %La balle est lancee au temps tl
    if (t > tl) 
      qBalle = SEDRK4t0(qBalle,t,deltaT, 'g', Constantes.MASSE_BALLE_kg);
      rBalle = [qBalle(4), qBalle(5), qBalle(6)]    
    endif
        
    t = t+deltaT;
    tf = t;
  
  endwhile

  rbaf = rBalle;
  rbof = rBoite;

endfunction
