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
        error ("Le nombre d'arguments entré pour l'objet aileron est invalide\n");
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
    
    %Calcul directement la position du CM par rapport � l'origine
    function a = calculCMOrigin(obj)
      x = obj.largeur/2;              %valeur donn�e dans les consignes
      y = 0;
      z = obj.longueur/2 + (2*1.345); %1.345 = rayon du fuselage
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
    function mI = momentInertie(obj)
    
       ix = (obj.masse/12)*((obj.largeur^2)+(obj.epaisseur^2));
       iy = (obj.masse/12)*((obj.longueur^2)+(obj.epaisseur^2));
       iz = (obj.masse/12)*((obj.longueur^2)+(obj.largeur^2));
       
       mI = [ix, iy, iz];
    
    endfunction
    
    function mIOrigine = momentInertieOrigine(obj, positionCDMAvion, positionCDMObjet)
    #Selon les notes de cours (diapo 73 cours 2) on cherhce le moment d'inertie par rapport au point d qui est le cdm.
    
      fprintf("AILERON::positionCDMObjet : \n");
      fprintf("x = %d \n", positionCDMObjet(1));
      fprintf("y = %d \n", positionCDMObjet(2));
      fprintf("z = %d \n", positionCDMObjet(3));
    
      fprintf("AILLERON: positionCDMAvion : \n");
      fprintf("x = %d \n", positionCDMAvion(1));
      fprintf("y = %d \n", positionCDMAvion(2));
      fprintf("z = %d \n", positionCDMAvion(3));
    
    dc = positionCDMAvion - positionCDMObjet;
    
    
    mIOrigine = obj.momentInertie + (obj.masse *...
    [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
    (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
    (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef

