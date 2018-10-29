

function [gResult] = g (q0, t)


% F = ma 
% Sachant que la somme des forces est égale à la masse * accélération,
% on peut trouver l'accélération, puisqu'on a les forces appliquer sur le ballon
% et la masse appliqué sur le ballon.


printf("gx**************************************************\n");


% Selon la diapo 30 chapitre 3
gResult = [q0];


%g0 = [a(1); a(2); a(3); q(1); q(2); q(3); q(7); q(8); q(9)];

endfunction