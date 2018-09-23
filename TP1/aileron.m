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
      z = obj.longueur/2 + (2*1.345) + 0.25; %1.345 = rayon du fuselage  0.25 = �paisseur de l'aile
      
      a = [x, y, z];
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
    function mI = momentInertie(obj)
    
       ix = (obj.masse/12)*((obj.largeur^2)+(obj.longueur^2));
       iy = (obj.masse/12)*((obj.epaisseur^2)+(obj.longueur^2));
       iz = (obj.masse/12)*((obj.epaisseur^2)+(obj.largeur^2));
       
      mI = [ix,0,0;0,iy,0;0,0,iz];
       
      #fprintf("aileron obj.masse %d : \n", obj.masse);
      #fprintf("aileron obj.largeur %d : \n", obj.largeur);
      #fprintf("aileron obj.epaisseur %d : \n", obj.epaisseur);
     # fprintf("aileron obj.longueur %d : \n", obj.longueur);
      #fprintf("aileron :: momentInertie : \n");
      #disp(mI);
    
    endfunction
    
    function mIOrigine = momentInertieOrigine(obj, aileron, positionCDMAvion, positionCDMObjet)
    #Selon les notes de cours (diapo 73 cours 2) on cherhce le moment d'inertie par rapport au point d qui est le cdm.
    
    #fprintf("aileron :: positionCDMAvion : %d\n");
    #disp(positionCDMAvion);
    #fprintf("aileron :: obj.getPositionCMOrigin() : %d\n");
    #disp(obj.getPositionCMOrigin());
    
    dc = positionCDMAvion - positionCDMObjet;
    
    #fprintf("aileron :: dc : \n"); 
    #disp(dc);
    
    #megaDC =[((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)),(-dc(1)*dc(3));(-dc(2)*dc(1)),((dc(1)^2)+(dc(3)^2)),(-dc(2)*dc(3));(-dc(3)*dc(1)),(-dc(3)*dc(2)),((dc(1)^2)+(dc(2)^2))];
      
    #fprintf("aileron :: megaDC : \n");
    #disp(megaDC);
    
    mIOrigine = aileron.momentInertie + (aileron.masse *...
    [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
    (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
    (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef

