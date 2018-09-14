clear all;
clc;


f = fusee(3, [6,7,8]);


f.obtenirMasse();


position = f.obtenirPositionNez();
fprintf("x = %d \n", position(1));
fprintf("y = %d \n", position(2));
fprintf("z = %d \n", position(3));