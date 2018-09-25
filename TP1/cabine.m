classdef cabine
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionCMDansAvion = [0, 0, 0]; 
    vecteurNezCM = [0, 0, 0];    
    positionCM = [0, 0, 0];
 endproperties

  methods
   function c = cabine(longueurCabine, rayonCabine, masseCabine, positionNezAvion, angleNez)
       if (nargin != 5)
        error ("Le nombre d'arguments entrÃ© pour l'objet cabine est invalide\n");
      endif
      c.longueur = longueurCabine;
      c.rayon = rayonCabine;
      c.masse = masseCabine;
      c.positionCMDansAvion = calculCMDansAvion(c);
      c.vecteurNezCM = c.positionCMDansAvion - [22.95+3.82, 0, 1.345+0.25];
      c.positionCM = calculCM(c, positionNezAvion, angleNez);
    endfunction
    
    function longueur = obtenirLongueur(obj)
      longueur = obj.longueur()
    endfunction
    
    function rayon = obtenirRayon(obj)
      rayon = obj.rayon()
    endfunction
    
    function masse = obtenirMasse(obj)
      masse = obj.masse()
    endfunction
        
    %Calcul directement la position du CM par rapport ï¿½ l'origine de l'avion
    function positionCMDansAvion = calculCMDansAvion(obj)
      x = 22.95 + obj.longueur/4;              %22.95 = longueurFuselage
      y = 0;
      z = obj.rayon + 0.25; %0.25 = épaisseur de l'aile
      
      positionCMDansAvion = [x, y, z];
    endfunction
    
    %Calcul directement la position du CM par rapport a l'axe du laboratoire
    function positionCM = calculCM(obj, positionNezAvion, angleNez)
      positionCM = positionNezAvion + ...
                        obj.vecteurNezCM * ...
                        [cos(angleNez), 0, sin(angleNez);...
                        0, 1, 0;...
                        -sin(angleNez), 0, cos(angleNez)];  %Matrice de rotation    
    endfunction
    
    function positionCMDansAvion = getPositionCMDansAvion(obj)
      positionCMDansAvion = obj.positionCMDansAvion;
    endfunction
    
    function positionCM = getPositionCM(obj)
      positionCM = obj.positionCM;
    endfunction       
    
    function mI = momentInertie(obj)
    
       ix = 0.0125*obj.masse*(((obj.rayon^2)*12)+((obj.longueur^2)*3));
       iy = 0.0125*obj.masse*(((obj.rayon^2)*12)+((obj.longueur^2)*3));
       iz = 0.3*(obj.masse*obj.rayon^2);
       
       mI = [ix,0,0;0,iy,0;0,0,iz];
    endfunction
  
    function mIOrigine = momentInertieOrigine(obj, positionCDMAvion)
      
      dc = positionCDMAvion - obj.positionCM();
      
      mIOrigine = obj.momentInertie + (obj.masse *...
      [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
      (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
      (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef