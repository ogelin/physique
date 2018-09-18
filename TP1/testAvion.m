clear all;
clc;

avion = avion([0,0,0],0,0,0);
avion.initPartiesAvion();

fprintf("\navion : \n");
fprintf("Masse Totale : %d \n", avion.masse());
positionavion = avion.getPositionCMOrigin();
fprintf("Fuselage : \n");
fprintf("x = %d \n", positionavion(1));
fprintf("y = %d \n", positionavion(2));
fprintf("z = %d \n", positionavion(3));

momentInertieavion = avion.momentInertieavion();

fprintf("momentInertieavion : \n");
fprintf("x = %d \n", momentInertieavion(1));
fprintf("y = %d \n", momentInertieavion(2));
fprintf("z = %d \n", momentInertieavion(3));

momentInertieavionOrigine = avion.momentInertieavionOrigine(positionavion);

fprintf("momentInertieavionOrigine : \n");
fprintf("x = %d \n", momentInertieavionOrigine(1));
fprintf("y = %d \n", momentInertieavionOrigine(2));
fprintf("z = %d \n", momentInertieavionOrigine(3));