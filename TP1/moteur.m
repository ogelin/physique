classdef moteur
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    direction = 0;
    positionCMDansAvion = [0, 0, 0]; 
    vecteurNezCM = [0, 0, 0];    
    positionCM = [0, 0, 0];
 endproperties

  methods
   function c = moteur(longueurMoteur, rayonMoteur, masseMoteur, directionMoteur, positionNezAvion, angleNez)
      if (nargin != 6)
        error ("Le nombre d'arguments entré pour l'objet moteur est invalide\n");
      endif
      c.longueur = longueurMoteur;
      c.rayon = rayonMoteur;
      c.masse = masseMoteur;
      c.direction = directionMoteur;
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
    
    function a = obtenirDirection(obj)
      a = obj.direction();
    endfunction
                
    %Calcul directement la position du CM par rapport � l'origine de l'avion
    function positionCMDansAvion = calculCMDansAvion(obj)
      x = 5;
      if (obj.direction == -1)  %-1 pour gauche, 1 pour droit
        y = -(obj.rayon + 1.345);
      elseif (obj.direction == 1)
        y = obj.rayon + 1.345;  %1.345 = rayon fuselage
      endif
      z = 1.345 + 0.25;       %0.25 = epaisseur ailes
      
      
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
       
      fprintf("moteur obj.masse %d : \n", obj.masse);
      fprintf("moteur obj.rayon %d : \n", obj.rayon);
      fprintf("moteur obj.longueur %d : \n", obj.longueur);
      fprintf("moteur :: momentInertie : \n");
      disp(mI);
    
  endfunction
  
   function mIOrigine = momentInertieOrigine(obj, positionCDMAvion)
      fprintf("moteur :: positionCDMAvion : %d\n");
      disp(positionCDMAvion);
      fprintf("moteur :: obj.getPositionCMOrigin() : %d\n");
      disp(obj.positionCM());
      
      dc = positionCDMAvion - obj.positionCM();
      
      fprintf("moteur :: dc : \n"); 
      disp(dc);
      
      megaDC =[((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)),(-dc(1)*dc(3));(-dc(2)*dc(1)),((dc(1)^2)+(dc(3)^2)),(-dc(2)*dc(3));(-dc(3)*dc(1)),(-dc(3)*dc(2)),((dc(1)^2)+(dc(2)^2))];
      
      fprintf("moteur :: megaDC : \n");
      disp(megaDC);
      
      mIOrigine = obj.momentInertie + (obj.masse *...
      [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
      (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
      (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
  
  
    
  endmethods
endclassdef
