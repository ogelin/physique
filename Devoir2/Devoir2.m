#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [But tf rf vf] = Devoir2 (ri, vi, wi)

precision = 0.001;
nCol = 0;




while(nCol < 4)

qn = SEDK4T0(q0, t0, deltaT, g);

col = verifierCollision(qn);

Ncol = Ncol + col;

iF(qn(2) - rb > precision)
  (nCol = 4)
  else
  deltaT = DeltaT/10
endif
endwhile

endfunction
