classdef avion<handle
 properties
    masse = 0;
    angleNez = 0;
    positionNezATerre = [0, 0, 0];
    positionNezEnVol = [0, 0, 0]; 
    positionCMDansAvion = [0, 0, 0]; 
    positionCM = [0, 0, 0];
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
      f.positionCMDansAvion = calculCMDansAvion(f);
      f.vecteurNezCMATerre = f.positionCMDansAvion - f.positionNezATerre;
      f.positionCM = calculPositionCM(f);
    endfunction

    function initPartiesAvion(obj)
      obj.aileron = aileron(2.1, 1.28, 0.07, 0.5, obj.positionNezEnVol, obj.angleNez);
      obj.aile = aile(10.6, 1.14, 0.25, 3.25, obj.positionNezEnVol, obj.angleNez);
      obj.cabine = cabine(3.82, 1.345, 0.7, obj.positionNezEnVol, obj.angleNez);
      obj.fuselage = fuselage(22.95, 1.345, 15.1, obj.positionNezEnVol, obj.angleNez);
      obj.moteurGauche = moteur(3.68, 0.724, 1.7, 1, obj.positionNezEnVol, obj.angleNez);
      obj.moteurDroit = moteur(3.68, 0.724, 1.7, -1, obj.positionNezEnVol, obj.angleNez);
    endfunction
    
    function positionNezATerre = caculPositionNezATerre(obj)
      positionNezATerre = [obj.fuselage.longueur + obj.cabine.longueur, 0, obj.cabine.rayon + 0.25];
    endfunction
    
    function masseTot = calculMasse(obj)
      masseTot = obj.aile.masse + obj.aileron.masse...
      + obj.cabine.masse + obj.fuselage.masse + obj.moteurGauche.masse*2;
    endfunction
    
    function positionCMDansAvion = calculCMDansAvion(obj)
      positionCMDansAvion = (obj.aile.getPositionCMDansAvion * obj.aile.masse...
      + obj.aileron.getPositionCMDansAvion * obj.aileron.masse...
      + obj.cabine.getPositionCMDansAvion * obj.cabine.masse...
      + obj.fuselage.getPositionCMDansAvion * obj.fuselage.masse...
      + obj.moteurGauche.getPositionCMDansAvion * obj.moteurGauche.masse...
      + obj.moteurDroit.getPositionCMDansAvion * obj.moteurDroit.masse) / obj.masse;
    endfunction
    
    %Cette formule est la formule de rotation des notes de cours.
    function positionCM = calculPositionCM(obj)
      positionCM = obj.positionNezEnVol + ...
                        obj.vecteurNezCMATerre * ...
                        [cos(obj.angleNez), 0, sin(obj.angleNez);...
                        0, 1, 0;...
                        -sin(obj.angleNez), 0, cos(obj.angleNez)];  %Matrice de rotation
                        
      fprintf("Vecteur CM - Nez : %d \n", obj.vecteurNezCMATerre);                 
                        
    endfunction
    
    function y = obtenirMasse(obj)
      y = obj.masse();
    endfunction
    
    function a = getPositionCMDansAvion(obj)
      a = obj.positionCMDansAvion;
    endfunction
    
    function a = getPositionCM(obj)
      a = obj.positionCM;
    endfunction
    
    function momentInertie = momentInertieAvion(obj)
    momentInertie = (2*obj.aile.momentInertie...
    + obj.aileron.momentInertie...
    + obj.cabine.momentInertie...
    + obj.fuselage.momentInertie...
    + obj.moteurGauche.momentInertie...
    + obj.moteurDroit.momentInertie);
    endfunction
    
    function momentInertieOrigineTotal = momentInertieAvionOrigine(obj)
    
    fprintf("AVION :: positionCMAvionEnVol : \n");
    fprintf("x = %d \n", obj.positionCM(1));
    fprintf("y = %d \n", obj.positionCM(2));
    fprintf("z = %d \n", obj.positionCM(3));
    
    momentInertieAileron = obj.aileron.momentInertieOrigine(obj.positionCM);
    fprintf("AVION :: moment inertie aileron : \n");
    disp(momentInertieAileron);
    
    momentInertieAile = obj.aile.momentInertieOrigine(obj.positionCM);
    fprintf("AVION :: moment inertie aile : \n");
    disp(momentInertieAile);
    
    momentInertieCabine = obj.cabine.momentInertieOrigine(obj.positionCM);
    fprintf("AVION :: moment inertie cabine : \n");
    disp(momentInertieCabine);
    
    momentInertieFuselage = obj.fuselage.momentInertieOrigine(obj.positionCM);
    fprintf("AVION :: moment inertie fuselage : \n");
    disp(momentInertieFuselage);
    
    momentInertieMoteurGauche = obj.moteurGauche.momentInertieOrigine(obj.positionCM);
    fprintf("AVION :: moment inertie moteur gauche : \n");
    disp(momentInertieMoteurGauche);
    
    momentInertieMoteurDroit = obj.moteurDroit.momentInertieOrigine(obj.positionCM);
    fprintf("AVION :: moment inertie moteur droit : \n");
    disp(momentInertieMoteurDroit);
    
    momentInertieOrigineTotalSansRotation = momentInertieAileron + momentInertieAile + momentInertieCabine...
    + momentInertieFuselage + momentInertieMoteurGauche + momentInertieMoteurDroit;
    fprintf("AVION :: moment inertie total de l'avion : \n");
    disp(momentInertieOrigineTotalSansRotation);
    
    R = inv(obj.calculMatriceRotationAvion(obj.angleNez));
    fprintf("AVION::R : \n");
    disp(R);
    
    inverseR = obj.calculMatriceRotationAvion(obj.angleNez)
    
    fprintf("AVION::angleNez : \n");
    disp(obj.angleNez);
    
    momentInertieOrigineTotalAvecRotation = R*momentInertieOrigineTotalSansRotation*inverseR;
    
    fprintf("AVION::momentInertieOrigineTotalAvecRotation : \n");
    disp(momentInertieOrigineTotalAvecRotation);
    
    momentInertieOrigineTotal = momentInertieOrigineTotalAvecRotation;
    endfunction
    
    function matriceRotation = calculMatriceRotationAvion(obj, angleRoationY)
    
    matriceRotation = [cos(angleRoationY), 0 sin(angleRoationY); 0, 1, 0 ; -sin(angleRoationY), 0, cos(angleRoationY);];
    
    endfunction
    
    function positionForce1 = calculPositionForce1(obj, angleRoationY)
    #Est dans la direction de l'axe du moteur et est exercée à l'arrière du moteur en son centre.
    
    x = obj.moteurDroit.getPositionCM()(1) - (3.68/2);
    y = obj.moteurDroit.getPositionCM()(2);
    z = obj.moteurDroit.getPositionCM()(3);
    
    positionForce1 = [x, y, z];
    
    fprintf("Avion :: positionForce1 : %d \n", positionForce1);
    
    endfunction
    
    function positionForce2 = calculPositionForce2(obj, angleRoationY)
    #Est dans la direction de l'axe du moteur et est exercée à l'arrière du moteur en son centre.
    
    x = obj.moteurGauche.getPositionCM()(1) - (3.68/2);
    y = obj.moteurGauche.getPositionCM()(2);
    z = obj.moteurGauche.getPositionCM()(3);
    
    positionForce2 = [x, y, z];
    
    fprintf("Avion :: positionForce2 : %d \n", positionForce2);
    
    endfunction
    
    function positionForce3 = calculPositionForce3(obj)
    #Cette force est dans la direction verticale, quelle que soit l'orientation de l'appareil.
    #Est appliquée sous les ailes au centre la surface de contact entre les ailes.
    
    x = obj.aile.getPositionCM()(1);
    y = obj.aile.getPositionCM()(2);
    z = obj.aile.getPositionCM()(3) - obj.aile.epaisseur/2;
    
    positionForce3 = [x, y, z];
    
    fprintf("Avion :: positionForce3 : %d \n", positionForce3);
    
    endfunction
    
    function tau = calculTau(obj, positionForce1, positionForce2, positionForce3, force)
          rc = obj.positionCM();
        fprintf("RC : %d \n",rc);
        
        tau1 = [(positionForce1 - rc) * force(1)];
        fprintf("Tau 1 : %d \n",tau1);
        tau2 = [(positionForce2 - rc) * force(2)];
        fprintf("Tau 2 : %d \n",tau2);
        tau3 = [(positionForce3 - rc) * force(3)];
        fprintf("Tau 3 : %d \n",tau3);
        fprintf("Force 3 : %d \n", force(3));
        
        
        tau = tau1 + tau2 + tau3
        
    endfunction
    
    function AA = caculAccelerationAngulaire(obj, vitesseAngulaire, matriceMI, tau)
    
    vitesseAngulaire;
   # vitesseAngulaireTransposee = [vitesseAngulaire(1); vitesseAngulaire(2); vitesseAngulaire(3);];
   # fprintf("Avion :: vitesseAngulaireTransposee : %d \n", vitesseAngulaireTransposee);
    
    
    vitesseAngulaire; 
    fprintf("Avion :: vitesseAngulaire : \n");
    disp(vitesseAngulaire);
    
    matriceMI; 
    fprintf("Avion :: matriceMI : \n");
    disp(matriceMI);
    
    matriceMIInverse = inv(matriceMI);
    fprintf("Avion :: matriceMIInverse :\n");
    disp(matriceMIInverse);

    
    vecteurW = matriceMIInverse * vitesseAngulaire;
    fprintf("Avion :: vecteurW :\n");
    disp(vecteurW);
    
    #vecteurWTranspose = [vecteurW(1), vecteurW(2), vecteurW(3)];
    
    matriceIdentite = [0, -vitesseAngulaire(3), vitesseAngulaire(2);...
    vitesseAngulaire(3), 0, -vitesseAngulaire(1);...
    -vitesseAngulaire(2), vitesseAngulaire(1), 0; ];
    
    vagueW = matriceIdentite * vecteurW;
    fprintf("Avion :: vagueW :\n");
    disp(vagueW);
    
    
    x= matriceIdentite*vecteurW;
    fprintf("Avion :: x :\n");
    disp(x);
    
    transposeX = [x(1),x(2),x(3)]
    
    y = vagueW*transposeX;
    fprintf("Avion :: y :\n");
    disp(y);

    
    z = tau - y;
    fprintf("Avion :: z :\n");
    disp(z);
    
    nouveauZ = [z(1);z(4);z(7)]
    
    AA = matriceMIInverse*[nouveauZ];
    endfunction

  endmethods
endclassdef
