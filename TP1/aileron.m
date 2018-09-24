classdef aileron
 properties
    longueur = 0;
    largeur = 0;
    epaisseur = 0;
    masse = 0;
    positionCMDansAvion = [0, 0, 0]; 
    vecteurNezCM = [0, 0, 0];    
    positionCM = [0, 0, 0];
 endproperties

  methods
   function c = aileron(longueurAileron, largeurAileron, epaisseurAileron, masseAileron, positionNezAvion, angleNez)
      if (nargin != 6)
        error ("Le nombre d'arguments entré pour l'objet aileron est invalide\n");
      endif
      c.longueur = longueurAileron;
      c.largeur = largeurAileron;
      c.epaisseur = epaisseurAileron;
      c.masse = masseAileron;
      c.positionCMDansAvion = calculCMDansAvion(c);
      c.vecteurNezCM = c.positionCMDansAvion - [22.95+3.82, 0, 1.345+0.25];
      c.positionCM = calculCM(c, positionNezAvion, angleNez);
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
    
    %Calcul directement la position du CM par rapport � l'origine de l'avion
    function positionCMDansAvion = calculCMDansAvion(obj)
      x = obj.largeur/2;              %valeur donn�e dans les consignes
      y = 0;
      z = obj.longueur/2 + (2*1.345) + 0.25; %1.345 = rayon du fuselage  0.25 = �paisseur de l'aile
      
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
    
    function mIOrigine = momentInertieOrigine(obj, positionCDMAvion)
    #Selon les notes de cours (diapo 73 cours 2) on cherhce le moment d'inertie par rapport au point d qui est le cdm.
    
    #fprintf("aileron :: positionCDMAvion : %d\n");
    #disp(positionCDMAvion);
    #fprintf("aileron :: obj.getPositionCMOrigin() : %d\n");
    #disp(obj.getPositionCMOrigin());
    
    dc = positionCDMAvion - obj.positionCM;
    
    #fprintf("aileron :: dc : \n"); 
    #disp(dc);
    
    #megaDC =[((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)),(-dc(1)*dc(3));(-dc(2)*dc(1)),((dc(1)^2)+(dc(3)^2)),(-dc(2)*dc(3));(-dc(3)*dc(1)),(-dc(3)*dc(2)),((dc(1)^2)+(dc(2)^2))];
      
    #fprintf("aileron :: megaDC : \n");
    #disp(megaDC);
    
    mIOrigine = obj.momentInertie + (obj.masse *...
    [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
    (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
    (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef

