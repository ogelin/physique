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
        error ("Le nombre d'arguments entré pour l'objet cone est invalide\n");
      endif
      c.longueur = longueurCone;
      c.rayon = rayonCone;
      c.masse = masseCone;
      c.positionXYZ = [positionXYZCone(1), positionXYZCone(2), positionXYZCone(3)];
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
    
    function v = obtenirPositionXYZ(obj)
      
      x = obj.positionXYZ(1);
      y = obj.positionXYZ(2);
      z = obj.positionXYZ(3);
      
      v = [x, y, z];
      
    endfunction

  endmethods
endclassdef