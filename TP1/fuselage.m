


classdef fuselage
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionCMOrigin = [0, 0, 0];  
 endproperties

  methods
   function c = fuselage(longueurFuselage, rayonFuselage, masseFuselage)
      if (nargin != 3)
        error ("Le nombre d'arguments entré pour l'objet fuselage est invalide\n");
      endif
      c.longueur = longueurFuselage;
      c.rayon = rayonFuselage;
      c.masse = masseFuselage;
      c.positionCMOrigin = calculCMOrigin(c);
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
    
    %Calcul directement la position du CM par rapport � l'origine
    function a = calculCMOrigin(obj)
      x = obj.longueur / 2;
      y = 0;
      z = obj.rayon + 0.25;  %0.25 est hardcod� et �quivaux � l'�paisseur des ailes
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
    function mI = momentInertie(obj)
    
       ix = ((obj.masse/4)*(obj.rayon^2))*((obj.masse/12)*(obj.longueur^2));
       iy = ((obj.masse/4)*(obj.rayon^2))*((obj.masse/12)*(obj.longueur^2));
       iz = (obj.masse/2)*(obj.rayon^2);
       
       mI = [ix, iy, iz];
    
    endfunction
    
  endmethods
endclassdef

