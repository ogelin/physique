function [vecteurNormal] = trouverVecteurNormal(rCMBalle, rCollision)
    tmp = rCMBalle - rCollision; 
    
    vecteurNormal = tmp / sqrt(tmp(1)^2+tmp(2)^2+tmp(3)^2);    
endfunction
