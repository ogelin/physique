classdef aileDroit
 properties
    longueur = 0;
    largeur = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function p = aileDroit(longueurAileDroit, largeurAileDroit, masseAileDroit, positionXYZAileDroit)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet AileDroit est invalide\n");
      endif
      p.longueur = longueurAileDroit;
      p.largeur = largeurAileDroit;
      p.masse = masseAileDroit;
      p.positionXYZ = [positionXYZAileDroit(1), positionXYZAileDroit(2), positionXYZAileDroit(3)];
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