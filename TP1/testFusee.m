clear all;
clc;

coneCabine = cabine(3,4,5, [6,7,8]);
f = fusee(12, [6,7,8], coneCabine);

f.obtenirMasse();

fprintf ("Masse cabine\n");
x = f.obtenirMasseCabine(cabine);
disp(x);
fprintf ("Fin Masse cabine\n");

positionNez = f.obtenirPositionNez();
fprintf("x = %d \n", positionNez(1));
fprintf("y = %d \n", positionNez(2));
fprintf("z = %d \n", positionNez(3));


positionCDMCabine = f.trouverPositionCDMFCabine();
fprintf("x = %d \n", positionCDMCabine(1));
fprintf("y = %d \n", positionCDMCabine(2));
fprintf("z = %d \n", positionCDMCabine(3));