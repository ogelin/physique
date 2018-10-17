

function [qent] = q(position, vitesse, acceleration)

printf("q **************************************************\n");


qent = [ position(1); position(2); position(3); ...
        vitesse(1); vitesse(2); vitesse(3); ...
        acceleration(1); acceleration(2); acceleration(3)]; ...

endfunction
