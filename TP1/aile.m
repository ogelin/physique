classdef aile
 properties
    longueur = 0;
    largeur = 0;
    epaisseur = 0;
    masse = 0;
    positionCMOrigin = [0, 0, 0];    
 endproperties

  methods
   function c = aile(longueurAile, largeurAile, epaisseurAile, masseAile)
      if (nargin != 4)
        error ("Le nombre d'arguments entrÃ© pour l'objet aile est invalide\n");
      endif
      c.longueur = 2*longueurAile;
      c.largeur = largeurAile;
      c.epaisseur = epaisseurAile;
      c.masse = masseAile;
      c.positionCMOrigin = calculCMOrigin(c);
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
    
        
    %Calcul directement la position du CM par rapport à l'origine
    function a = calculCMOrigin(obj)
      x = 10.54;            %valeur donnée dans les consignes
      y = 0;
      z = obj.epaisseur/2;
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
  endmethods
endclassdef

