#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [But tf rf vf] = Devoir2 (ri, vi, wi)

precision = 0.001;
nCol = 0;

t0 = 0; 
deltaT = 0.01; 

while(nCol < 4)

printf("wi");
disp(wi);

printf("vi");
disp(vi);

printf("ri");
disp(ri);



printf("Devoir2**************************************************\n");

q0 = q(vi, wi, ri);
vi = [q0(1), q0(2), q0(3)]

wi = [q0(4), q0(5), q0(6)]
printf("Devoir2**************************************************\n");

printf("q0");
disp(q0);

F = sommeDesForces(vi, wi);

printf("sommeDesForces\n");
disp(F);
printf("Devoir2**************************************************\n");
a = acceleration(F);
printf("Devoir2**************************************************\n");

printf("acceleration\n");
disp(a);
printf("Devoir2**************************************************\n");

qx = SEDRK4t0(q0,t0,deltaT,g);

printf("Devoir2**************************************************\n");

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
