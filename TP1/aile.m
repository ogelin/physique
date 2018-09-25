classdef aile
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
   function c = aile(longueurAile, largeurAile, epaisseurAile, masseAile, positionNezAvion, angleNez)
      if (nargin != 6)
        error ("Le nombre d'arguments entrÃ© pour l'objet aile est invalide\n");
      endif
      c.longueur = 2*longueurAile;
      c.largeur = largeurAile;
      c.epaisseur = epaisseurAile;
      c.masse = 2*masseAile;
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
    
    %Calcul directement la position du CM par rapport ï¿½ l'origine de l'avion
    function positionCMDansAvion = calculCMDansAvion(obj)
      x = 10.54;            %valeur donnée dans les consignes
      y = 0;
      z = obj.epaisseur/2;
      
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
       ix = (obj.masse/12)*((obj.largeur^2)+(obj.epaisseur^2));
       iy = (obj.masse/12)*((obj.longueur^2)+(obj.epaisseur^2));
       iz = (obj.masse/12)*((obj.longueur^2)+(obj.largeur^2));
       
      mI = [ix,0,0;0,iy,0;0,0,iz];
       
      fprintf("aile obj.masse %d : \n", obj.masse);
      fprintf("aile obj.largeur %d : \n", obj.largeur);
      fprintf("aile obj.epaisseur %d : \n", obj.epaisseur);
      fprintf("aile obj.longueur %d : \n", obj.longueur);
      fprintf("aile :: momentInertie : \n");
      disp(mI);
    
    endfunction
    
    function mIOrigine = momentInertieOrigine(obj, positionCDMAvion)
      
      fprintf("aile :: positionCDMAvion : %d\n");
      disp(positionCDMAvion);
      fprintf("aile :: obj.getPositionCM : %d\n");
      disp(obj.getPositionCM);
      
      dc = positionCDMAvion - obj.positionCM();
      
      fprintf("aile :: dc : \n");
      disp(dc);
      
      megaDC =[((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)),(-dc(1)*dc(3));(-dc(2)*dc(1)),((dc(1)^2)+(dc(3)^2)),(-dc(2)*dc(3));(-dc(3)*dc(1)),(-dc(3)*dc(2)),((dc(1)^2)+(dc(2)^2))];
      
      fprintf("aile :: megaDC : \n");
      disp(megaDC);
      
      mIOrigine = obj.momentInertie + (obj.masse *...
      [((dc(2)^2)+(dc(3)^2)),(-dc(1)*dc(2)), (-dc(1)*dc(3));...
      (-dc(2)*dc(1)), ((dc(1)^2)+(dc(3)^2)), (-dc(2)*dc(3));...
      (-dc(3)*dc(1)), (-dc(3)*dc(2)), ((dc(1)^2)+(dc(2)^2))]);
    
    endfunction
    
  endmethods
endclassdef

