clear all;
clc;


c = cabine(3,4,5, [6,7,8]);



c.obtenirLongueur();

c.obtenirRayon();

c.obtenirMasse();


position = c.obtenirPositionXYZ();
fprintf("x = %d \n", position(1));
fprintf("y = %d \n", position(2));
fprintf("z = %d \n", position(3));