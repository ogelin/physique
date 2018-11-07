function [vecteurNormal] = trouverVecteurNormal(rCMBalle, rCollision, typeCollision)
    tmp = rCMBalle - rCollision; %Pas bon!!!
    
    
    
    vecteurNormal = tmp / sqrt(tmp(1)^2+tmp(2)^2+tmp(3)^2); %rendre le vecteur unitaire en divisant par la norme
endfunction
