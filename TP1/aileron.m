


classdef aileron
 properties
    longueur = 0;
    largeur = 0;
    epaisseur = 0;
    masse = 0;
    positionCMOrigin = [0, 0, 0];     
 endproperties

  methods
   function c = aileron(longueurAileron, largeurAileron, epaisseurAileron, masseAileron)
      if (nargin != 4)
        error ("Le nombre d'arguments entrÃ© pour l'objet aileron est invalide\n");
      endif
      c.longueur = longueurAileron;
      c.largeur = largeurAileron;
      c.epaisseur = epaisseurAileron;
      c.masse = masseAileron;
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
      x = obj.largeur/2;              %valeur donnée dans les consignes
      y = 0;
      z = obj.longueur/2 + (2*1.345); %1.345 = rayon du fuselage
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
  endmethods
endclassdef

