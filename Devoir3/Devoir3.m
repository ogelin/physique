function [Coup tf vbaf vbof wbof rbaf rbof ]=Devoir3(vbal,wboi,tl)

  t = 0;
  deltaT = 0.01;
  
  %Code temporaire
  %Valeurs de retour du programme
  Coup = 0;
  tf = 0;
  theta = 0;
  vbaf = [transpose([0,0,0;0,0,0])];
  vbof = [transpose([0,0,0;0,0,0])];
  wbof = wboi;
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
  while (rBalle(3)>Constantes.RAYON_BOITE_m + Constantes.PRECISION_VOULUE ...
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
    
    %Calcul de la distance entre les deux objets
    distanceEntreBalleBoite = sqrt((rBalle(1)-rBoite(1))^2+(rBalle(2)-rBoite(2))^2+(rBalle(3)-rBoite(3))^2);
    distanceMinEnteBalleBoite = Constantes.RAYON_BALLE_m + Constantes.HAUTEUR_BOITE_m/2;
    
    if(distanceEntreBalleBoite < 3 * distanceMinEnteBalleBoite)
      deltaT = 0.00001;
    else
      deltaT = 0.01;
    endif
        
  
endwhile

    vitesseCMBalle = [qBalle(1), qBalle(2), qBalle(3)];
    vitesseCMBoite = [qBoite(1), qBoite(2), qBoite(3)];
    vbaf(1:3,1) = vitesseCMBalle;
    vbaf(1:3,2) = vitesseCMBalle;
    vbof(1:3,1) = vitesseCMBoite;
    vbof(1:3,2) = vitesseCMBoite;

  if (estCollision)
    wbof(1:3,1) = wiBoite;
    rCMBalle = [qBalle(4), qBalle(5), qBalle(6)];
    rCMBoite = [qBoite(4), qBoite(5), qBoite(6)];
    
   [normaleBoite, normaleBalle] = trouverVecteurNormal(...
                                                        rBalle,...
                                                        rBoite,...
                                                        theta(2),...
                                                        estCollision...
                                                        );

    % Cette equation a valider, peut-etre quon devrait verifier que lon prend le bon vecteur normal

 
    rCollision = rCMBalle - Constantes.RAYON_BALLE_m .* transpose(normaleBalle);
   
    %Selon vos preferences
    %rCollision2 = rCMBalle + Constantes.RAYON_BALLE_m .* transpose(normaleBalle); 
  
    
    
    
    impulsion = calculImpulsion(...
                                vitesseCMBalle,...
                                vitesseCMBoite,...
                                rCMBoite,...
                                rCollision,...
                                wiBoite,...
                                normaleBalle );
    
   

    %Calcul vitesse finale
    vbaf(:,2) = vitesseCMBalle + (impulsion.*transpose(normaleBalle))/Constantes.MASSE_BALLE_kg;
    vbof(:,2) = vitesseCMBoite + (impulsion.*transpose(normaleBoite))/Constantes.MASSE_BOITE_kg;
    
    momentInertieBoite = calculMomentInertieBoite(theta(2), rCMBoite);
    
    distCMBoiteCollision = rCollision - rCMBoite;
  
    vitesseAngulaireBoiteApresCollision = transpose(wiBoite)...
    - impulsion .* transpose(inverse(momentInertieBoite)...
    * transpose(cross(distCMBoiteCollision, transpose(normaleBoite))));
    
    wbof = transpose(vitesseAngulaireBoiteApresCollision);
      
  endif
  
  if (estCollision != 0)
    Coup = 1;
  endif
  rbaf = rBalle;
  rbof = rBoite;

endfunction
