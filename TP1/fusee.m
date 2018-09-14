

classdef fusee
 properties
    masse = 0;
    positionNez = [0, 0, 0];  
 endproperties

  methods
   function f = fusee(masseFusee, positionNezFusee)
      #if (nargin != 2)
       # error ("Le nombre d'arguments entré pour l'objet cylindre est invalide\n");
      #endif
      f.masse = masseFusee;
      f.positionNez(1) = positionNezFusee(1);
      f.positionNez(2) = positionNezFusee(2);
      f.positionNez(3) = positionNezFusee(3);
    endfunction
    
    
    function obtenirMasse(obj)
      obj.masse()
    endfunction
    
    function v = obtenirPositionNez(obj)
      
      x = obj.positionNez(1);
      y = obj.positionNez(2);
      z = obj.positionNez(3);
      
      v = [x, y, z];
      
    endfunction

  endmethods
endclassdef
