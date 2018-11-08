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
  
  estCollision = Constantes.COUP_MANQUE;
  
  %La simulation s'arrete quand la boite touche le sol ou la balle
  while (rBoite(3)>Constantes.HAUTEUR_BOITE_m/2 ...
         && estCollision == Constantes.COUP_MANQUE) 
         
    qBoite = SEDRK4t0(qBoite,t,deltaT, 'g', Constantes.MASSE_BOITE_kg, aireBoite());
    rBoite = [qBoite(4), qBoite(5), qBoite(6)];
    theta = wiBoite*t;
      
    %La balle est lancee au temps tl
    if (t >= tl) 
      qBalle = SEDRK4t0(qBalle,t,deltaT, 'g', Constantes.MASSE_BALLE_kg, aireBalle());
      rBalle = [qBalle(4), qBalle(5), qBalle(6)];
      
      estCollision = verifierCollision(rBalle, rBoite, theta(2));
      
    endif
    
    t = t+deltaT;
    tf = t;
    
    if(rBalle(1) > 2.5 && rBalle(1) < 3.09)
      deltaT = 0.0001;
    endif
    if(rBalle(1) < 2.1 || rBalle(1) > 3.09)
      deltaT = 0.01;
    endif
        
  
  endwhile

  if (estCollision)
    vitesseCMBalle = [qBalle(1), qBalle(2), qBalle(3)];
    vitesseCMBoite = [qBoite(1), qBoite(2), qBoite(3)];
    rCMBalle = [qBalle(4), qBalle(5), qBalle(6)];
    rCMBoite = [qBoite(4), qBoite(5), qBoite(6)];
    rCollision = [0,0,0]; %TODO 

    impulsion = calculImpulsion(vitesseCMBalle, vitesseCMBoite, rCMBalle, rCollision, wiBoite, theta(2), estCollision);

    %Calcul vitesse finale
    vaf = vitesseCMBalle + impulsion/Constantes.MASSE_BALLE_kg;
    vbf = vitesseCMBoite + impulsion/Constantes.MASSE_BOITE_kg;
  
    %vitesseAngulaireBoiteApresCollision =  momentinertieInversee*momentCinetiqueFinale;
  
  %faire fonction a part pour inertie voir devoir2;
  %faire fct moment cinetique
  %momentCinetique = momentCinetiqueInertie + cross(positionCMBalle,impulsion);
  %
  
  endif
  
  Coup = estCollision;
  rbaf = rBalle;
  rbof = rBoite;

endfunction
