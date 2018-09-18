classdef fusee<handle
 properties
    masse = 0;
    positionNez = [0, 0, 0]; 
    positionCMOrigin = [0, 0, 0];
    aileron = 0;
    aile = 0;
    cabine = 0;
    fuselage = 0;
    moteurGauche = 0;
    moteurDroit = 0;

 endproperties

  methods
   function f = fusee(positionNezFusee, angle, vitesseRotation, forces) #
      #if (nargin != 4)
       # error ("Le nombre d'arguments entré pour l'objet fusee est invalide\n");
      #endif
      f.positionNez = [positionNezFusee(1), positionNezFusee(2), positionNezFusee(3)];
      initPartiesAvion(f);
      f.masse = calculMasse(f);
      f.positionCMOrigin = calculCMOrigin(f);
    endfunction

    function initPartiesAvion(obj)
      obj.aileron = aileron(2.1, 1.28, 0.07, 0.5);
      obj.aile = aile(10.6, 1.14, 0.25, 3.25);
      obj.cabine = cabine(3.82, 1.345, 0.7);
      obj.fuselage = fuselage(22.95, 1.345, 15.1);
      obj.moteurGauche = moteur(3.68, 0.724, 1.7, -1);
      obj.moteurDroit = moteur(3.68, 0.724, 1.7, 1);
    endfunction
    
    function masseTot = calculMasse(obj)
      masseTot = obj.aile.masse + obj.aileron.masse...
      + obj.cabine.masse + obj.fuselage.masse + obj.moteurGauche.masse*2;
    endfunction
    
    function positionCMOrigin = calculCMOrigin(obj)
      positionCMOrigin = (obj.aile.getPositionCMOrigin * obj.aile.masse...
      + obj.aileron.getPositionCMOrigin * obj.aileron.masse...
      + obj.cabine.getPositionCMOrigin * obj.cabine.masse...
      + obj.fuselage.getPositionCMOrigin * obj.fuselage.masse...
      + obj.moteurGauche.getPositionCMOrigin * obj.moteurGauche.masse...
      + obj.moteurDroit.getPositionCMOrigin * obj.moteurDroit.masse) / obj.masse;
    endfunction
    
    function positionCMPieceRelatif = positionCMPieceRelatif(piece, masse)
      positionCMPieceRelatif = masse;
    endfunction
    

    
    function y = obtenirMasse(obj)
      y = obj.masse();
    endfunction
    
    function a = getPositionCMOrigin(obj)
      a = obj.positionCMOrigin;
    endfunction
    
    
    function v = obtenirPositionNez(obj)
      
      x = obj.positionNez(1);
      y = obj.positionNez(2);
      z = obj.positionNez(3);
      
      v = [x, y, z];
      
    endfunction
    
    function x = obtenirMasseCone(obj)
    
    x = obj.obtenirMasse();
    
    endfunction
    
    function momentInertieTotal = momentInertieFusee(obj)
    momentInertieTotal = (2*obj.aile.momentInertie...
    + obj.aileron.momentInertie...
    + obj.cabine.momentInertie...
    + obj.fuselage.momentInertie...
    + obj.moteurGauche.momentInertie...
    + obj.moteurDroit.momentInertie);
    endfunction

  endmethods
endclassdef
