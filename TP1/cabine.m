classdef cabine
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionCMOrigin = [0, 0, 0];  
 endproperties

  methods
   function c = cabine(longueurCabine, rayonCabine, masseCabine)
       if (nargin != 3)
        error ("Le nombre d'arguments entré pour l'objet cabine est invalide\n");
      endif
      c.longueur = longueurCabine;
      c.rayon = rayonCabine;
      c.masse = masseCabine;
      c.positionCMOrigin = calculCMOrigin(c);
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
        
    %Calcul directement la position du CM par rapport � l'origine
    function a = calculCMOrigin(obj)
      x = 22.95 + obj.longueur/4;              %22.95 = longueurFuselage
      y = 0;
      z = obj.rayon;
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
    function mI = momentInertie(obj)
    
       ix = 0.3*obj.masse*(((obj.rayon^2)/2)+((obj.longueur^2)/3));
       iy = 0.3*obj.masse*(((obj.rayon^2)/2)+((obj.longueur^2)/3));
       iz = 0.3*(obj.masse*obj.rayon^2);
       
       mI = [ix, iy, iz];
    
    endfunction
    
  endmethods
endclassdef