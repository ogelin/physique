


classdef moteur
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    direction = 0;
    positionCMOrigin = [0, 0, 0];  
 endproperties

  methods
   function c = moteur(longueurMoteur, rayonMoteur, masseMoteur, directionMoteur)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet moteur est invalide\n");
      endif
      c.longueur = longueurMoteur;
      c.rayon = rayonMoteur;
      c.masse = masseMoteur;
      c.direction = directionMoteur;
      c.positionCMOrigin = calculCMOrigin(c);
    endfunction
    
    function a = obtenirLongueur(obj)
      a = obj.longueur();
    endfunction
    
    function a = obtenirRayon(obj)
      a = obj.rayon();
    endfunction
    
    function a = obtenirMasse(obj)
      a = obj.masse();
    endfunction
    
    function a = obtenirDirection(obj)
      a = obj.direction();
    endfunction
    
        
    %Calcul directement la position du CM par rapport � l'origine
    function a = calculCMOrigin(obj)
      x = 5;
      if (obj.direction == -1)  %-1 pour gauche, 1 pour droit
        y = -(obj.rayon + 1.345);
      elseif (obj.direction == 1)
        y = obj.rayon + 1.345;  %1.345 = rayon fuselage
      endif
      z = 1.345 + 0.25;       %0.25 = epaisseur ailes
      
      a = [x, y, z];  
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
  endmethods
endclassdef