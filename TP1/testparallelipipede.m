clear all;
clc;

aile = aile(10.6,1.14,0.25, 3.25);

positionAile = aile.getPositionCMOrigin();
fprintf("Fuselage : \n");
fprintf("x = %d \n", positionAile(1));
fprintf("y = %d \n", positionAile(2));
fprintf("z = %d \n", positionAile(3));


aileron = aileron(2.1,1.28,0.07, 0.5);

positionAileron = aileron.getPositionCMOrigin();
fprintf("Fuselage : \n");
fprintf("x = %d \n", positionAileron(1));
fprintf("y = %d \n", positionAileron(2));
fprintf("z = %d \n", positionAileron(3));
