

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






%g0 = [a(1); a(2); a(3); q(1); q(2); q(3); q(8); q(9); q(10); premiereFraction; deuxiemeFraction; troisiemeFraction; quatriemeFraction];


%Calcul non utilisé que je conserve, car je ne suis pas certaine de la véritable solution.

%ici, selon la diapositive 32 chapitre 3, il faut remplacer q(1) par q(0), q(2) par q(1)
% et ainsi de suite puisqu'en matlab les indices débutent par 0.

%premiereFraction = (-q(11)*q(8) - q(12)*q(10))/2;

%deuxiemeFraction = (q(10)*q(7) + q(13)*q(10) - q(13)*q(8))/2;

%troisiemeFraction = (q(10)*q(8) + q(13)*q(7) - q(12)*q(9))/2;

%quatriemeFraction = (q(10)*q(9)+q(11)*q(8)-q(10)*q(7))/2;