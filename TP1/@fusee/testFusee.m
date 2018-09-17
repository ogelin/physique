clear all;
clc;

cabine = cone(3,4,5, [6,7,8]);
#f = fusee(12, [6,7,8], 3,4,5, [6,7,8]);
f = fusee(12, [6,7,8], cabine);

f.obtenirMasse();

masseCone = 0;
fprintf ("Masse cone\n", f.obtenirMasseCone(cabine));
f.obtenirMasseCone(cabine);

fprintf ("Fin Masse cone\n");

positionNez = f.obtenirPositionNez();
fprintf("x = %d \n", positionNez(1));
fprintf("y = %d \n", positionNez(2));
fprintf("z = %d \n", positionNez(3));


positionCDMCabine = f.trouverPositionCDMFCabine();
fprintf("x = %d \n", positionCDMCabine(1));
fprintf("y = %d \n", positionCDMCabine(2));
fprintf("z = %d \n", positionCDMCabine(3));