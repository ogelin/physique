


classdef fuselage
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = fuselage(longueurFuselage, rayonFuselage, masseFuselage, positionXYZFuselage)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet fuselage est invalide\n");
      endif
      c.longueur = longueurFuselage;
      c.rayon = rayonFuselage;
      c.masse = masseFuselage;
      c.positionXYZ(1) = positionXYZFuselage(1);
      c.positionXYZ(2) = positionXYZFuselage(2);
      c.positionXYZ(3) = positionXYZFuselage(3);
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
    
    function a = obtenirPositionFuselage(obj)
      
      x = obj.positionXYZ(1) / 2;
      y = 0;
      z = 0;
      
      a = [x, y, z];
      
    endfunction
    
    function a = obtenirPositionOrigine(obj)
      
      x = 0;
      y = 0;
      z = obtenirRayon(obj) + 0.25;
      
      a = [x, y, z];
      
    endfunction

    
  endmethods
endclassdef

