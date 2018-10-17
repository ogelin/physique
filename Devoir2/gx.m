

function [gResult] = g (q, t)


% F = ma 
% Sachant que la somme des forces est égale à la masse * accélération,
% on peut trouver l'accélération, puisqu'on a les forces appliquer sur le ballon
% et la masse appliqué sur le ballon.

vi = [q(1), q(2), q(3)]

wi = [q(4), q(5), q(6)]

F = sommeDesForces(vi, wi);

a = acceleration(F);


% Selon la diapo 30 chapitre 3
gResult = [a(1); a(2); a(3); q(1); q(2); q(3)];


g0 = [a(1); a(2); a(3); q(1); q(2); q(3); q(7); q(8); q(9)];


endfunction