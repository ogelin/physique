


classdef aile
 properties
    longueur = 0;
    largeur = 0;
    epaisseur = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = aile(longueurAile, largeurAile, epaisseurAile, masseAile, positionXYZAile)
      if (nargin != 5)
        error ("Le nombre d'arguments entré pour l'objet aile est invalide\n");
      endif
      c.longueur = 2*longueurAile;
      c.largeur = largeurAile;
      c.epaisseur = epaisseurAile;
      c.masse = masseAile;
      c.positionXYZ(1) = positionXYZAile(1);
      c.positionXYZ(2) = positionXYZAile(2);
      c.positionXYZ(3) = positionXYZAile(3);
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
    
    function a = obtenirPositionAile(obj)
      
      x = 0;
      y = 0;
      z = obtenirEpaisseur(obj) / 2;
      
      a = [x, y, z];
      
    endfunction
    
    function a = obtenirPositionOrigineAile(obj)
      
      x = obj.positionXYZ(1);
      y = 0;
      z = 0;
      
      a = [x, y, z];
      
    endfunction

    
  endmethods
endclassdef

