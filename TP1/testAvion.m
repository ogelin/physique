clear all;
clc;


fprintf("CAS 1 : \n")
avion = avion([26.77,0,1.595],0,[0,0,0],[11,11,260]);
avion.initPartiesAvion();

fprintf("\navion : \n");
fprintf("Masse Totale : %d \n", avion.masse());

%Je ne pense pas que ceci fasse vraiment ce que l'on veut
%Le fprintf "fuselage" n'est pas vrai.
positionAvionATerre = avion.getPositionCMATerre();
fprintf("Position avion avec getPositionCMATerre : \n");
fprintf("x = %d \n", positionAvionATerre(1));
fprintf("y = %d \n", positionAvionATerre(2));
fprintf("z = %d \n", positionAvionATerre(3));

positionAvionEnVol = avion.getPositionCMEnVol();
fprintf("Position avion avec getPositionCMEnVol : \n");
fprintf("x = %d \n", positionAvionEnVol(1));
fprintf("y = %d \n", positionAvionEnVol(2));
fprintf("z = %d \n", positionAvionEnVol(3));


momentInertieAvion = avion.momentInertieAvion();

fprintf("TESTAVION::momentInertieavion : \n");
fprintf("x = %d \n", momentInertieAvion(1));
fprintf("y = %d \n", momentInertieAvion(2));
fprintf("z = %d \n", momentInertieAvion(3));

momentInertieAvionOrigine = avion.momentInertieAvionOrigine(positionAvionATerre);

fprintf("TESTAVION::momentInertieavionOrigine : \n");
fprintf("x = %d \n", momentInertieAvionOrigine(1));
fprintf("y = %d \n", momentInertieAvionOrigine(2));
fprintf("z = %d \n", momentInertieAvionOrigine(3));

