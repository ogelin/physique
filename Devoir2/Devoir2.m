#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [Reponse] = Devoir2 (ri, vi, wi)

ballonRayon = 0.11; # en mètre

precision = 0.001;
nCol = 0;

t0 = 0; 
deltaT = 0.01; 

F = sommeDesForces(vi, wi);
printf("sommeDesForces\n");
disp(F);

a = acceleration(F);
printf("acceleration\n");
disp(a);

ncol = 3;
tf = 0;
rf = 0;
vf = 0;

while(nCol < 4)

printf("wi");
disp(wi);

printf("vi");
disp(vi);

printf("ri");
disp(ri);

q0 = q(vi, ri, a);
vi = [q0(1), q0(2), q0(3)];


printf("q0");
disp(q0);


printf("Devoir2**************************************************\n");


%qResultatPositionX = SEDRK4t0(positionX,t0,deltaT,gx);
qResultat = SEDRK4t0(q0,t0,deltaT, 'g');



col = verifierCollision(qResultat);

ncol = ncol + col;

if(qResultat(2) - ballonRayon > precision)
  (nCol = 4)
  else
  deltaT = DeltaT/10
endif

q0 = qResultat; 
t0 = t0 + deltaT;
tf = t0;
rf = [qResultat(1), qResultat(2), qResultat(3)];
vf = [qResultat(4), qResultat(5), qResultat(6)];
But = ncol;


endwhile

Reponse = [But, tf, rf, vf];

endfunction
