classdef moteur
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    direction = 0;
    positionCMOrigin = [0, 0, 0];  
 endproperties

  methods
   function c = moteur(longueurMoteur, rayonMoteur, masseMoteur, directionMoteur)
      if (nargin != 4)
        error ("Le nombre d'arguments entré pour l'objet moteur est invalide\n");
      endif
      c.longueur = longueurMoteur;
      c.rayon = rayonMoteur;
      c.masse = masseMoteur;
      c.direction = directionMoteur;
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
    
    function a = obtenirDirection(obj)
      a = obj.direction();
    endfunction
    
        
    %Calcul directement la position du CM par rapport � l'origine
    function a = calculCMOrigin(obj)
      x = 5;
      if (obj.direction == -1)  %-1 pour gauche, 1 pour droit
        y = -(obj.rayon + 1.345);
      elseif (obj.direction == 1)
        y = obj.rayon + 1.345;  %1.345 = rayon fuselage
      endif
      z = 1.345 + 0.25;       %0.25 = epaisseur ailes
      
      a = [x, y, z];  
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
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
      disp(obj.getPositionCMOrigin());
      
      dc = positionCDMAvion - obj.getPositionCMOrigin();
      
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
