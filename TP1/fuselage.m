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
        error ("Le nombre d'arguments entré pour l'objet Fuselage est invalide\n");
      endif
      c.longueur = longueurFuselage;
      c.rayon = rayonFuselage;
      c.masse = masseFuselage;
      c.positionXYZ = [positionXYZFuselage(1), positionXYZFuselage(2), positionXYZFuselage(3)];
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
    
    function a = obtenirPositionXYZ(obj)
      
      x = obj.positionXYZ(1);
      y = obj.positionXYZ(2);
      z = obj.positionXYZ(3);
      
      a = [x, y, z];
      
    endfunction

  endmethods
endclassdef

