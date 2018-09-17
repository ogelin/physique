


classdef moteur
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionXYZ = [0, 0, 0];  
 endproperties

  methods
   function c = moteur(longueurMoteur, rayonMoteur, masseMoteur, positionXYZMoteur)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet moteur est invalide\n");
      endif
      c.longueur = longueurMoteur;
      c.rayon = rayonMoteur;
      c.masse = masseMoteur;
      c.positionXYZ(1) = positionXYZMoteur(1);
      c.positionXYZ(2) = positionXYZMoteur(2);
      c.positionXYZ(3) = positionXYZMoteur(3);
    endfunction
    
    function a = obtenirLongueur(obj)
      a = obj.longueur();
    endfunction
    
    function a = obtenirRayon(obj)
      a = obj.rayon();
    endfunction
    
    function a = obtenirMasse(obj)
      a = obj.masse();
    endfunction
    
    function a = obtenirPositionMoteurGauche(obj)
      
      x = obj.positionXYZ(1) / 2;
      y = 0;
      z = 0;
      
      a = [x, y, z];
      
    endfunction
    
    function a = obtenirPositionOrigineGauche(obj)
      
      x = 5;
      y = obj.positionXYZ(2);
      z = obtenirRayon(obj) + 0.25;
      
      a = [x, y, z];
      
    endfunction
    
    function a = obtenirPositionMoteurDroite(obj)
      
      x = obj.positionXYZ(1) / 2;
      y = 0;
      z = 0;
      
      a = [x, y, z];
      
    endfunction
    
    function a = obtenirPositionOrigineDroite(obj)
      
      x = 5;
      y = obj.positionXYZ(2);
      z = obtenirRayon(obj) + 0.25;
      
      a = [x, y, z];
      
    endfunction

    
  endmethods
endclassdef
