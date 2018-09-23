classdef cabine
 properties
    longueur = 0;
    rayon = 0;
    masse = 0;
    positionCMOrigin = [0, 0, 0];  
 endproperties

  methods
   function c = cabine(longueurCabine, rayonCabine, masseCabine)
       if (nargin != 3)
        error ("Le nombre d'arguments entrÃ© pour l'objet cabine est invalide\n");
      endif
      c.longueur = longueurCabine;
      c.rayon = rayonCabine;
      c.masse = masseCabine;
      c.positionCMOrigin = calculCMOrigin(c);
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
        
    %Calcul directement la position du CM par rapport ï¿½ l'origine
    function a = calculCMOrigin(obj)
      x = 22.95 + obj.longueur/4;              %22.95 = longueurFuselage
      y = 0;
      z = obj.rayon + 0.25; %0.25 = épaisseur de l'aile
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
    function setPositionCMOrigin(obj, positionCMOriginXYZ)
      obj.positionCMOrigin = positionCMOriginXYZ;
    endfunction
    
    function mI = momentInertie(obj)
    
       ix = 0.0125*obj.masse*(((obj.rayon^2)*12)+((obj.longueur^2)*3));
       iy = 0.0125*obj.masse*(((obj.rayon^2)*12)+((obj.longueur^2)*3));
       iz = 0.3*(obj.masse*obj.rayon^2);
       
       mI = [ix,0,0;0,iy,0;0,0,iz];
       
      
      fprintf("cabine obj.masse %d : \n", obj.masse);
      fprintf("cabine obj.rayon %d : \n", obj.rayon);
      fprintf("cabine obj.longueur %d : \n", obj.longueur);
      fprintf("cabine :: momentInertie : \n");
      disp(mI);

    endfunction
  
    function mIOrigine = momentInertieOrigine(obj, positionCDMAvion)
      
     fprintf("aileron :: positionCDMAvion : %d\n");
     disp(positionCDMAvion);
     fprintf("aileron :: obj.getPositionCMOrigin() : %d\n");
     disp(obj.getPositionCMOrigin());
      
      dc = positionCDMAvion - obj.getPositionCMOrigin();
      
      fprintf("cabine :: dc : \n");
      disp(dc);
      
      megaDC =[((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)),(-dc(1)*dc(3));(-dc(2)*dc(1)),((dc(1)^2)+(dc(3)^2)),(-dc(2)*dc(3));(-dc(3)*dc(1)),(-dc(3)*dc(2)),((dc(1)^2)+(dc(2)^2))];
      
      fprintf("cabine :: megaDC : \n");
      disp(megaDC);
      
      mIOrigine = obj.momentInertie + (obj.masse *...
      [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
      (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
      (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef