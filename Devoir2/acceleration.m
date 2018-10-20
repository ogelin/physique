
function [a] = acceleration (forces)


printf("acceleration **************************************************\n");

ballonMasse = 0.45; # en kg

aX = forces(1)/ ballonMasse;
aY = forces(2)/ ballonMasse;
aZ = forces(3)/ ballonMasse;

printf('aX\n');
disp(aX);

a = [aX; aY; aZ];

endfunction
