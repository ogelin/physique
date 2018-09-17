


classdef aileron
 properties
    longueur = 0;
    largeur = 0;
    epaisseur = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = aileron(longueurAileron, largeurAileron, epaisseurAileron, masseAileron, positionXYZAileron)
      if (nargin != 5)
        error ("Le nombre d'arguments entré pour l'objet aileron est invalide\n");
      endif
      c.longueur = longueurAileron;
      c.largeur = largeurAileron;
      c.epaisseur = epaisseurAileron;
      c.masse = masseAileron;
      c.positionXYZ(1) = positionXYZAileron(1);
      c.positionXYZ(2) = positionXYZAileron(2);
      c.positionXYZ(3) = positionXYZAileron(3);
    endfunction
    
    function a = obtenirLongueur(obj)
      a = obj.longueur();
    endfunction
    
    function a = obtenirLargeur(obj)
      a = obj.largeur();
    endfunction
    
    function a = obtenirEpaisseur(obj)
      a = obj.epaisseur();
    endfunction
    
    function a = obtenirMasse(obj)
      a = obj.masse();
    endfunction
    
    function a = obtenirPositionAileron(obj)
      
      x = obtenirLargeur(obj) / 2;
      y = 0;
      z = obtenirLongueur(obj) / 2;
      
      a = [x, y, z];
      
    endfunction
    
    function a = obtenirPositionOrigineAileron(obj)
      
      x = 0;
      y = 0;
      z = obj.positionXYZ(3);
      
      a = [x, y, z];
      
    endfunction

    
  endmethods
endclassdef

