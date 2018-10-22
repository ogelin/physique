

function [qent] = q(position, vitesse, wi)


qent = [ position(1), position(2), position(3), ...
        vitesse(1), vitesse(2), vitesse(3), ...
        wi(1), wi(2), wi(3)];

endfunction
