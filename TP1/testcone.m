clear all;
clc;

cabine = cabine(3.82,1.345,0.7);

positionCabine = cabine.getPositionCMOrigin();
fprintf("Fuselage : \n");
fprintf("x = %d \n", positionCabine(1));
fprintf("y = %d \n", positionCabine(2));
fprintf("z = %d \n", positionCabine(3));

