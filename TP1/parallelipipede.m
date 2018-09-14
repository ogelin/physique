classdef parallelipipede
 properties
    longueur = 0;
    largeur = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function p = parallelipipede(longueurParallelipipede, largeurParallelipipede, masseParallelipipede, positionXYZParallelipipede)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet parallelipipede est invalide\n");
      endif
      p.longueur = longueurParallelipipede;
      p.largeur = largeurParallelipipede;
      p.masse = masseParallelipipede;
      p.positionXYZ(1) = positionXYZParallelipipede(1);
      p.positionXYZ(2) = positionXYZParallelipipede(2);
      p.positionXYZ(3) = positionXYZParallelipipede(3);
    endfunction
    
    function obtenirLongueur(obj)
      obj.longueur()
    endfunction
    
    function obtenirLargeur(obj)
       obj.largeur()
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