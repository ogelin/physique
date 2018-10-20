#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [But tf rf vf] = Devoir2 (ri, vi, wi)

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

while(nCol < 4)

printf("wi");
disp(wi);

printf("vi");
disp(vi);

printf("ri");
disp(ri);

q0 = q(vi, ri, a);
vi = [q0(1), q0(2), q0(3)]


printf("q0");
disp(q0);


printf("Devoir2**************************************************\n");


%qResultatPositionX = SEDRK4t0(positionX,t0,deltaT,gx);
q0 = SEDRK4t0(q0,t0,deltaT, 'g');


col = verifierCollision(qn);

Ncol = Ncol + col;

if(qn(2) - rb > precision)
  (nCol = 4)
  else
  deltaT = DeltaT/10
endif

q0 = qn; 
t0 = t0 + deltaT;

endwhile

endfunction
