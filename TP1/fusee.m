classdef fusee<handle
 properties
    masse = 0;
    positionNez = [0, 0, 0]; 

 endproperties

  methods
   function f = fusee(masseFusee, positionNezFusee, coneCabine) #
      #if (nargin != 2)
       # error ("Le nombre d'arguments entré pour l'objet fusee est invalide\n");
      #endif
      f.masse = masseFusee;
      f.positionNez = [positionNezFusee(1), positionNezFusee(2), positionNezFusee(3)];
      
    endfunction
    
    
    function y = obtenirMasse(obj)
      y = obj.masse();
    endfunction
    
    function v = obtenirPositionNez(obj)
      
      x = obj.positionNez(1);
      y = obj.positionNez(2);
      z = obj.positionNez(3);
      
      v = [x, y, z];
      
    endfunction
    
    function x = obtenirMasseCabine(obj)
    
    x = obj.obtenirMasse();
    
    endfunction
    
    
    function v = trouverPositionCDMFCabine(obj)
    
      #Faire la fonction du centre de masse à partir du nez de la fusée
      #Equation du cdm d'un cône z = 3/4(hauteur)
           
      positionCDMFuselageX = obj.positionNez(1);
      positionCDMFuselageY = obj.positionNez(2);
      positionCDMFuselageZ = obj.positionNez(3);
      #positionCDMFuselageZ = (obj.positionNez(3)-3/4(obj.coneCabine.positionXYZ(3)));
      
      v = [positionCDMFuselageX, positionCDMFuselageX, positionCDMFuselageX];
      
    endfunction

  endmethods
endclassdef
