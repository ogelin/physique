classdef moteurGauche
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = moteurGauche(longueurMoteurGauche, rayonMoteurGauche, masseMoteurGauche, positionXYZMoteurGauche)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet MoteurGauche est invalide\n");
      endif
      c.longueur = longueurMoteurGauche;
      c.rayon = rayonMoteurGauche;
      c.masse = masseMoteurGauche;
      c.positionXYZ = [positionXYZMoteurGauche(1), positionXYZMoteurGauche(2), positionXYZMoteurGauche(3)];
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
    
    function a = obtenirPositionXYZ(obj)
      
      x = obj.positionXYZ(1);
      y = obj.positionXYZ(2);
      z = obj.positionXYZ(3);
      
      a = [x, y, z];
      
    endfunction

  endmethods
endclassdef

