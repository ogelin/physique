clear all;
clc;


p = parallelipipede(3,4,5, [6,7,8]);



p.obtenirLongueur();

p.obtenirLargeur();

p.obtenirMasse();


position = p.obtenirPositionXYZ();
fprintf("x = %d \n", position(1));
fprintf("y = %d \n", position(2));
fprintf("z = %d \n", position(3));