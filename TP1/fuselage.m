classdef fuselage
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionCMDansAvion = [0, 0, 0]; 
    vecteurNezCM = [0, 0, 0];    
    positionCM = [0, 0, 0];
 endproperties

  methods
   function c = fuselage(longueurFuselage, rayonFuselage, masseFuselage, positionNezAvion, angleNez)
      if (nargin != 5)
        error ("Le nombre d'arguments entré pour l'objet fuselage est invalide\n");
      endif
      c.longueur = longueurFuselage;
      c.rayon = rayonFuselage;
      c.masse = masseFuselage;
      c.positionCMDansAvion = calculCMDansAvion(c);
      c.vecteurNezCM = c.positionCMDansAvion - [22.95+3.82, 0, 1.345+0.25];
      c.positionCM = calculCM(c, positionNezAvion, angleNez);
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
            
    %Calcul directement la position du CM par rapport � l'origine de l'avion
    function positionCMDansAvion = calculCMDansAvion(obj)
      x = obj.longueur / 2;
      y = 0;
      z = obj.rayon + 0.25;  %0.25 est hardcod� et �quivaux � l'�paisseur des ailes
      
      positionCMDansAvion = [x, y, z];
    endfunction
    
    %Calcul directement la position du CM par rapport a l'axe du laboratoire
    function positionCM = calculCM(obj, positionNezAvion, angleNez)
      positionCM = positionNezAvion + ...
                        obj.vecteurNezCM * ...
                        [cos(angleNez), 0, sin(angleNez);...
                        0, 1, 0;...
                        -sin(angleNez), 0, cos(angleNez)];  %Matrice de rotation    
    endfunction
    
    function positionCMDansAvion = getPositionCMDansAvion(obj)
      positionCMDansAvion = obj.positionCMDansAvion;
    endfunction
    
    function positionCM = getPositionCM(obj)
      positionCM = obj.positionCM;
    endfunction  
    
    function mI = momentInertie(obj)
    
       ix = ((obj.masse/4)*(obj.rayon^2))+((obj.masse/12)*(obj.longueur^2));
       iy = ((obj.masse/4)*(obj.rayon^2))+((obj.masse/12)*(obj.longueur^2));
       iz = (obj.masse/2)*(obj.rayon^2);
       
       mI = [ix,0,0;0,iy,0;0,0,iz];
    
  endfunction
  
      function mIOrigine = momentInertieOrigine(obj, positionCDMAvion)
      
      dc = positionCDMAvion - obj.positionCM();
      
      
      mIOrigine = obj.momentInertie + (obj.masse *...
      [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
      (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
      (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef

