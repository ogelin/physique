classdef avion<handle
 properties
    masse = 0;
    angleNez = 0;
    positionNezATerre = [0, 0, 0];
    positionNezEnVol = [0, 0, 0]; 
    positionCMATerre = [0, 0, 0]; 
    positionCMEnVol = [0, 0, 0];
    vecteurNezCMATerre = [0, 0, 0];
    aileron = 0;
    aile = 0;
    cabine = 0;
    fuselage = 0;
    moteurGauche = 0;
    moteurDroit = 0;

 endproperties

  methods
   function f = avion(positionNezAvion, angle, vitesseRotation, forces) #
      #if (nargin != 4)
       # error ("Le nombre d'arguments entré pour l'objet avion est invalide\n");
      #endif
      f.positionNezEnVol = [positionNezAvion(1), positionNezAvion(2), positionNezAvion(3)];
      f.angleNez = angle;
      initPartiesAvion(f);
      f.positionNezATerre = caculPositionNezATerre(f);
      f.masse = calculMasse(f);
      f.positionCMATerre = calculCMATerre(f);
      f.vecteurNezCMATerre = f.positionCMATerre - f.positionNezATerre;
      f.positionCMEnVol = calculPositionCMEnVol(f);
    endfunction

    function initPartiesAvion(obj)
      obj.aileron = aileron(2.1, 1.28, 0.07, 0.5);
      obj.aile = aile(10.6, 1.14, 0.25, 3.25);
      obj.cabine = cabine(3.82, 1.345, 0.7);
      obj.fuselage = fuselage(22.95, 1.345, 15.1);
      obj.moteurGauche = moteur(3.68, 0.724, 1.7, -1);
      obj.moteurDroit = moteur(3.68, 0.724, 1.7, 1);
    endfunction
    
    function positionNezATerre = caculPositionNezATerre(obj)
      positionNezATerre = [obj.fuselage.longueur + obj.cabine.longueur, 0, obj.cabine.rayon];
    endfunction
    
    function masseTot = calculMasse(obj)
      masseTot = obj.aile.masse + obj.aileron.masse...
      + obj.cabine.masse + obj.fuselage.masse + obj.moteurGauche.masse*2;
    endfunction
    
    function positionCMATerre = calculCMATerre(obj)
      positionCMATerre = (obj.aile.getPositionCMOrigin * obj.aile.masse...
      + obj.aileron.getPositionCMOrigin * obj.aileron.masse...
      + obj.cabine.getPositionCMOrigin * obj.cabine.masse...
      + obj.fuselage.getPositionCMOrigin * obj.fuselage.masse...
      + obj.moteurGauche.getPositionCMOrigin * obj.moteurGauche.masse...
      + obj.moteurDroit.getPositionCMOrigin * obj.moteurDroit.masse) / obj.masse;
    endfunction
    
    %Cette formule est la formule de rotation des notes de cours.
    function positionCMEnVol = calculPositionCMEnVol(obj)
      positionCMEnVol = obj.positionNezEnVol + ...
                        obj.vecteurNezCMATerre * ...
                        [cos(obj.angleNez), 0, sin(obj.angleNez);...
                        0, 1, 0;...
                        -sin(obj.angleNez), 0, cos(obj.angleNez)];  %Matrice de rotation
    endfunction
    
    function y = obtenirMasse(obj)
      y = obj.masse();
    endfunction
    
    function a = getPositionCMATerre(obj)
      a = obj.positionCMATerre;
    endfunction
    
    function momentInertie = momentInertieAvion(obj)
    momentInertie = (2*obj.aile.momentInertie...
    + obj.aileron.momentInertie...
    + obj.cabine.momentInertie...
    + obj.fuselage.momentInertie...
    + obj.moteurGauche.momentInertie...
    + obj.moteurDroit.momentInertie);
    endfunction
    
    function momentInertieOrigine = momentInertieAvionOrigine(obj)
    
    fprintf("AVION :: positionCMAvionEnVol : \n");
    fprintf("x = %d \n", obj.positionCMEnVol(1));
    fprintf("y = %d \n", obj.positionCMEnVol(2));
    fprintf("z = %d \n", obj.positionCMEnVol(3));
    
    aileron = obj.aileron.getPositionCMOrigin();
    fprintf("AVION :: aileron : \n");
    fprintf("x = %d \n", aileron(1));
    fprintf("y = %d \n", aileron(2));
    fprintf("z = %d \n", aileron(3));
    
    momentInertieOrigine = obj.aileron.momentInertieOrigine(obj.aileron, obj.positionCMEnVol, obj.aileron.calculCMOrigin());
    fprintf("AVION :: moment inertie aileron : \n");
    disp(momentInertieOrigine);
    
    momentInertieAile = obj.aile.momentInertieOrigine(obj.positionCMEnVol);
    fprintf("AVION :: moment inertie aile : \n");
    disp(momentInertieAile);
    
    momentInertieCabine = obj.cabine.momentInertieOrigine(obj.positionCMEnVol);
    fprintf("AVION :: moment inertie cabine : \n");
    disp(momentInertieCabine);
    
    endfunction

  endmethods
endclassdef
