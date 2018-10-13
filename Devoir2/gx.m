

function [retval] = gx (q, t)

vi = [q(1), q(2), q(3)]

wi = [q(8), q(9), q(10)]

F = sommeDesForces(vi, wi);

a = acceleration(F);

endfunction
