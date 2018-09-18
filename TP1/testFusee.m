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

momentInertieFusee = fusee.momentInertieFusee();

fprintf("momentInertieFusee : \n");
fprintf("x = %d \n", momentInertieFusee(1));
fprintf("y = %d \n", momentInertieFusee(2));
fprintf("z = %d \n", momentInertieFusee(3));

momentInertieFuseeOrigine = fusee.momentInertieFuseeOrigine(positionFusee);

fprintf("momentInertieFuseeOrigine : \n");
fprintf("x = %d \n", momentInertieFuseeOrigine(1));
fprintf("y = %d \n", momentInertieFuseeOrigine(2));
fprintf("z = %d \n", momentInertieFuseeOrigine(3));