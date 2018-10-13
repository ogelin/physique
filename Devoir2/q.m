

function [qent] = q(vitesse, vitesseAngulaire, position)


printf("vitesse");
disp(vitesse);

printf("vitesseAngulaire");
disp(vitesseAngulaire);

qent = [vitesse(1); vitesse(2); vitesse(3); ...
        vitesseAngulaire(1); vitesseAngulaire(2); vitesseAngulaire(3); ...
        position(1); position(2); position(3)]

endfunction



%qent = [vitesse(1); vitesse(2); vitesse(3); ...
%        position(1); position(2); position(3); ...
%        vitesseAngulaire(1); vitesseAngulaire(2); vitesseAngulaire(3); ...
%%        R(1,1); R(1,2); R(1,3); ... 
%        R(2,1); R(2,2); R(2,3) ...
%        R(3,1); R(3,2); R(3,3)];