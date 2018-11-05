

function [gResult] = g (q0,t0, masse, aire)

position = [q0(4), q0(5), q0(6)];

vitesse = [q0(1), q0(2), q0(3)];

wi = [q0(7), q0(8), q0(9)];

F = sommeDesForces(masse, aire, vitesse);

aX = F(1)/ masse;
aY = F(2)/ masse;
aZ = F(3)/ masse;

accelerationModifiee = [aX, aY, aZ];

wi = [0,0,0];
gResult = [accelerationModifiee, vitesse, wi];


endfunction






