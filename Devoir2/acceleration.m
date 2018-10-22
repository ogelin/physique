
function [a] = acceleration (forces)

ballonMasse = 0.45; # en kg

aX = forces(1)/ ballonMasse;
aY = forces(2)/ ballonMasse;
aZ = forces(3)/ ballonMasse;

a = [aX; aY; aZ];

endfunction
