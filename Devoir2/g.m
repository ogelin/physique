

function [gResult] = g (q0,t0)

%La fonction devrait pouvoir renvoyer la nouvelle vitesse, la nouvelle accélération et SEDRK4T0 se charge de la position;

%q(vitesse, vitesseAngulaire, position)

printf("g **************************************************\n");


printf('t0\n');
disp(t0);

position = [q0(1), q0(2), q0(3)];

vitesse = [q0(4), q0(5), q0(6)];

acceleration = [q0(7), q0(8), q0(9)];

wi = [q0(10), q0(11), q0(12)];

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

printf("g ICI accelerationModifiee**************************************************\n");
printf('accelerationModifiee\n');
disp(accelerationModifiee(1));
disp(accelerationModifiee(2));
disp(accelerationModifiee(3));


deltaPositionX = vitesse(1) .*t0 + ((accelerationModifiee(1) .*0.5).* (t0^2));
deltaPositionY = vitesse(2) .*t0 + ((accelerationModifiee(2) .*0.5).* (t0^2));
deltaPositionZ = vitesse(3) .*t0 + ((accelerationModifiee(3) .*0.5).* (t0^2));
deltaPosition = [deltaPositionX, deltaPositionY, deltaPositionZ];

disp(position(2));
wi = [0,0,0];
printf("g Après modifiée position**************************************************\n");        
gResult = [deltaPosition, vitesseModifiee, accelerationModifiee, wi];


endfunction






