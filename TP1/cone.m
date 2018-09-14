


classdef cone
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = cone(longueurCone, rayonCone, masseCone, positionXYZCone)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet cylindre est invalide\n");
      endif
      c.longueur = longueurCone;
      c.rayon = rayonCone;
      c.masse = masseCone;
      c.positionXYZ(1) = positionXYZCone(1);
      c.positionXYZ(2) = positionXYZCone(2);
      c.positionXYZ(3) = positionXYZCone(3);
    endfunction
    
    function obtenirLongueur(obj)
      obj.longueur()
    endfunction
    
    function obtenirRayon(obj)
      obj.rayon()
    endfunction
    
    function obtenirMasse(obj)
      obj.masse()
    endfunction
    
    function a = obtenirPositionXYZ(obj)
      
      x = obj.positionXYZ(1);
      y = obj.positionXYZ(2);
      z = obj.positionXYZ(3);
      
      a = [x, y, z];
      
    endfunction

  endmethods
endclassdef