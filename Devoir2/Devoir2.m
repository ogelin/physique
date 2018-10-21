#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [Reponse] = Devoir2 (ri, vi, wi)

ballonRayon = 0.11; # en mètre

precision = 0.001;
nCol = -4;

t0 = 0; 
deltaT = 0.01; 

printf("vi\n");
disp(vi);

F = sommeDesForces(vi, wi);
printf("sommeDesForces\n");
disp(F);

a = acceleration(F);
printf("acceleration\n");
disp(a);
But = -6;
tf = 0;
rf = 0;
vf = 0;

printf("wi");
disp(wi);

printf("vi");
disp(vi);

printf("ri");
disp(ri);

q0 = q(ri, vi, a);
vi = [q0(4), q0(5), q0(6)];


printf("q0");
disp(q0);

while(nCol == -4)



printf("Devoir2**************************************************\n");
printf('q0 dans le while devoir2');
disp(q0);
%qResultatPositionX = SEDRK4t0(positionX,t0,deltaT,gx);
qResultat = SEDRK4t0(q0,t0,deltaT, 'g');



col = verifierCollision(qResultat);
nCol = col;

q0 = qResultat; 
t0 = t0 + deltaT;
tf = t0;
rf = [q0(1), q0(2), q0(3)];
vf = [q0(4), q0(5), q0(6)];
But = nCol;


endwhile

Reponse = [But, tf, rf, vf];

endfunction
