clear all;
clc;

fusee = fusee([0,0,0],0,0,0);
fusee.initPartiesAvion();

fprintf("\nFusee : \n");
fprintf("Masse Totale : %d \n", fusee.masse());
positionFusee = fusee.getPositionCMOrigin();
fprintf("Fuselage : \n");
fprintf("x = %d \n", positionFusee(1));
fprintf("y = %d \n", positionFusee(2));
fprintf("z = %d \n", positionFusee(3));
