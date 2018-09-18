classdef aileron
 properties
    longueur = 0;
    largeur = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function p = aileron(longueurAileron, largeurAileron, masseAileron, positionXYZAileron)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet Aileron est invalide\n");
      endif
      p.longueur = longueurAileron;
      p.largeur = largeurAileron;
      p.masse = masseAileron;
      p.positionXYZ = [positionXYZAileron(1), positionXYZAileron(2), positionXYZAileron(3)];
    endfunction
    
    function longueur = obtenirLongueur(obj)
      longueur = obj.longueur()
    endfunction
    
    function largeur = obtenirLargeur(obj)
       largeur = obj.largeur()
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