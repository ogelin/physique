

function [gResult] = g (q0,t0)

%La fonction devrait pouvoir renvoyer la nouvelle vitesse, la nouvelle accélération et SEDRK4T0 se charge de la position;

%q(vitesse, vitesseAngulaire, position)

wi = [0;0;6.3];

printf("g **************************************************\n");


printf('t0\n');
disp(t0);

vitesse = [q0(4), q0(5), q0(6)];

position = [q0(1), q0(2), q0(3)];

acceleration = [q0(7), q0(8), q0(9)];


F = sommeDesForces(vitesse, wi);
printf('F\n');
disp(F);


accelerationModifiee = acceleration(F);

vitesseModifieeX = vitesse(1)  * [2/(2 + vitesse(1)*t0)];
vitesseModifieeY = vitesse(2)  * [2/(2 + vitesse(2)*t0)];
vitesseModifieeZ = vitesse(3)  * [2/(2 + vitesse(3)*t0)];

vitesseModifiee = [vitesseModifieeX, vitesseModifieeY, vitesseModifieeZ];


positionModifiee = position + (vitesse .t0 + ((accelerationModifiee .*0.5).* (t0^2)));

           
gResult = [positionModifiee; vitesseModifiee; accelerationModifiee];


endfunction






