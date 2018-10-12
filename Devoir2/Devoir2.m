#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [But tf rf vf] = Devoir2 (ri, vi, wi)

precision = 0.001;
nCol = 0;

t0 = 0; 
deltaT = 0.01; % ?????Je ne sais pas �a devrait �tre quelle valeur??????

while(nCol < 4)


q0 = q(vi, ri, vitesseAngulaire, R);

printf("q0");
disp(q0);



qn = SEDRK4t0(q0, t0, deltaT, 'g');

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
