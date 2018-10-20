

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
disp(F(1));
disp(F(2));
disp(F(3));


%accelerationModifiee = acceleration(F);

ballonMasse = 0.45; # en kg

aX = F(1)/ ballonMasse;
aY = F(2)/ ballonMasse;
aZ = F(3)/ ballonMasse;

accelerationModifiee = [aX, aY, aZ];

vitesseModifieeX = vitesse(1) + acceleration(1)*t0;
vitesseModifieeY = vitesse(2) + acceleration(2)*t0;
vitesseModifieeZ = vitesse(3) + acceleration(3)*t0;

vitesseModifiee = [vitesseModifieeX, vitesseModifieeY, vitesseModifieeZ];

printf("g ICI positionModifiee**************************************************\n");
printf('position\n');
disp(position(1));
disp(position(2));
disp(position(3));


positionModifiee = position + (vitesse .*t0 + ((accelerationModifiee .*0.5).* (t0^2)));

printf("g Après modifiée position**************************************************\n");        
gResult = [positionModifiee; vitesseModifiee; accelerationModifiee];


endfunction






