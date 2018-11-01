

function [qent] = q(vitesse, position, wi)


qent = [ vitesse(1), vitesse(2), vitesse(3), ...
        position(1), position(2), position(3), ...
        wi(1), wi(2), wi(3)];

endfunction
