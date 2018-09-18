classdef cabine
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = cabine(longueurCabine, rayonCabine, masseCabine, positionXYZCabine)
       if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet Cabine est invalide\n");
      endif
      c.longueur = longueurCabine;
      c.rayon = rayonCabine;
      c.masse = masseCabine;
      c.positionXYZ = [positionXYZCabine(1), positionXYZCabine(2), positionXYZCabine(3)];
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