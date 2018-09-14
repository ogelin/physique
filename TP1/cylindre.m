


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
      c.positionXYZ(1) = positionXYZCylindre(1);
      c.positionXYZ(2) = positionXYZCylindre(2);
      c.positionXYZ(3) = positionXYZCylindre(3);
    endfunction
    
    function a = obtenirLongueur(obj)
      a = obj.longueur()
    endfunction
    
    function a = obtenirRayon(obj)
      a = obj.rayon()
    endfunction
    
    function a = obtenirMasse(obj)
      a = obj.masse()
    endfunction
    
    function a = obtenirPositionXYZ(obj)
      
      x = obj.positionXYZ(1);
      y = obj.positionXYZ(2);
      z = obj.positionXYZ(3);
      
      a = [x, y, z];
    endfunction

  endmethods
endclassdef

