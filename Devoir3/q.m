

function [qent] = q(vitesse, position, wi)


qent = [ vitesse(1), vitesse(2), vitesse(3), ...
        vitesse(1), vitesse(2), vitesse(3), ...
        wi(1), wi(2), wi(3)];

endfunction
