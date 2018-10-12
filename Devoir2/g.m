

function [g0] = g (q, t)


% F = ma 
% Sachant que la somme des forces est égale à la masse * accélération,
% on peut trouver l'accélération, puisqu'on a les forces appliquer sur le ballon
% et la masse appliqué sur le ballon.

vi = [q(0), q(1), q(2)]

wi = [q(7), q(8), q(9)]

F = sommeDesForces(vi, wi);

a = acceleration(F);

%ici, selon la diapositive 32 chapitre 3, il faut remplacer q(1) par q(0), q(2) par q(1)
% et ainsi de suite puisqu'en matlab les indices débutent par 0.

premiereFraction = (-q(10)*q(7) - q(11)*q(9))/2;

deuxiemeFraction = (q(9)*q(6) + q(12)*q(9) - q(12)*q(7))/2;

troisiemeFraction = (q(9)*q(7) + q(12)*q(6) - q(11)*q(8))/2;

quatriemeFraction = (q(9)*q(8)+q(10)*q(7)-q(11)*q(6))/2;



g0 = [a(0); a(1); a(2); q(0); q(1); q(2); q(7); q(8); q(9); premiereFraction; deuxiemeFraction; troisiemeFraction; quatriemeFraction];

endfunction
