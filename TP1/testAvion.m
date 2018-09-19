clear all;
clc;

avion = avion([3.82+22.95, 0, 1.345], 0,0,0);
avion.initPartiesAvion();

fprintf("\navion : \n");
fprintf("Masse Totale : %d \n", avion.masse());
fprintf("PositionNez : %d \n", avion.positionNez);
fprintf("Distance Nez CM : %d \n", avion.distanceNezCM);
fprintf("Position Réelle CM : %d \n", avion.realCM);

positionavion = avion.getPositionCMOrigin();
fprintf("Fuselage : \n");
fprintf("x = %d \n", positionavion(1));
fprintf("y = %d \n", positionavion(2));
fprintf("z = %d \n", positionavion(3));

momentInertieAvion = avion.momentInertieAvion();

fprintf("TESTAVION::momentInertieavion : \n");
fprintf("x = %d \n", momentInertieAvion(1));
fprintf("y = %d \n", momentInertieAvion(2));
fprintf("z = %d \n", momentInertieAvion(3));

momentInertieAvionOrigine = avion.momentInertieAvionOrigine(positionavion);

fprintf("TESTAVION::momentInertieavionOrigine : \n");
fprintf("x = %d \n", momentInertieAvionOrigine(1));
fprintf("y = %d \n", momentInertieAvionOrigine(2));
fprintf("z = %d \n", momentInertieAvionOrigine(3));