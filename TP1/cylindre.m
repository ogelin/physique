


classdef cylindre
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = cylindre(longueurCylindre, rayonCylindre, masseCylindre, positionXYZCylindre)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet cylindre est invalide\n");
      endif
      c.longueur = longueurCylindre;
      c.rayon = rayonCylindre;
      c.masse = masseCylindre;
      c.positionXYZ = [positionXYZCylindre(1), positionXYZCylindre(2), positionXYZCylindre(3)];
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

