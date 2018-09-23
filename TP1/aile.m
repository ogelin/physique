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
        error ("Le nombre d'arguments entré pour l'objet aile est invalide\n");
      endif
      c.longueur = 2*longueurAile;
      c.largeur = largeurAile;
      c.epaisseur = epaisseurAile;
      c.masse = 2*masseAile;
      c.positionCMOrigin = calculCMOrigin(c);
    endfunction
    
    
    function a = obtenirLongueur(obj)
      a = obj.longueur();
    endfunction
    function setPositionCMOrigin(obj, positionCMOriginXYZ)
      obj.positionCMOrigin = positionCMOriginXYZ;
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
    
        
    %Calcul directement la position du CM par rapport � l'origine
    function a = calculCMOrigin(obj)
      x = 10.54;            %valeur donn�e dans les consignes
      y = 0;
      z = obj.epaisseur/2;
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
    function mI = momentInertie(obj)
       ix = (obj.masse/12)*((obj.largeur^2)+(obj.epaisseur^2));
       iy = (obj.masse/12)*((obj.longueur^2)+(obj.epaisseur^2));
       iz = (obj.masse/12)*((obj.longueur^2)+(obj.largeur^2));
       
      mI = [ix,0,0;0,iy,0;0,0,iz];
       
      #fprintf("aile obj.masse %d : \n", obj.masse);
      #fprintf("aile obj.largeur %d : \n", obj.largeur);
      #fprintf("aile obj.epaisseur %d : \n", obj.epaisseur);
     # fprintf("aile obj.longueur %d : \n", obj.longueur);
      #fprintf("aile :: momentInertie : \n");
     # disp(mI);
    
    endfunction
    
    function mIOrigine = momentInertieOrigine(obj, positionCDMAvion)
      
      #fprintf("aile :: positionCDMAvion : %d\n");
      #disp(positionCDMAvion);
      #fprintf("aile :: obj.getPositionCMOrigin() : %d\n");
      #disp(obj.getPositionCMOrigin());
      
      dc = positionCDMAvion - obj.getPositionCMOrigin();
      
      #fprintf("aile :: dc : \n");
     # disp(dc);
      
      #megaDC =[((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)),(-dc(1)*dc(3));(-dc(2)*dc(1)),((dc(1)^2)+(dc(3)^2)),(-dc(2)*dc(3));(-dc(3)*dc(1)),(-dc(3)*dc(2)),((dc(1)^2)+(dc(2)^2))];
      
      #fprintf("aile :: megaDC : \n");
      #disp(megaDC);
      
      mIOrigine = obj.momentInertie + (obj.masse *...
      [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
      (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
      (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef

