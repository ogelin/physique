

function [gResult] = g (q0,t0)

position = [q0(4), q0(5), q0(6)];

vitesse = [q0(1), q0(2), q0(3)];

wi = [q0(7), q0(8), q0(9)];

F = sommeDesForces(vitesse, wi);

ballonMasse = 0.45; # en kg

aX = F(1)/ ballonMasse;
aY = F(2)/ ballonMasse;
aZ = F(3)/ ballonMasse;

accelerationModifiee = [aX, aY, aZ];

wi = [0,0,0];
gResult = [accelerationModifiee, vitesse, wi];


endfunction






