function [vecteurNormal] = trouverVecteurNormal(rCMBalle, rCollision, typeCollision)
    tmp = rCMBalle - rCollision; %Pas bon!!!
    
    if(typeCollision==Constantes.COLLISION_BASE)
    
    elseif(typeCollision==Constantes.COLLISION_COTE)
    
    elseif(typeCollision==Constantes.COLLISION_ARETE)
    
    endif
    
    vecteurNormal = tmp / sqrt(tmp(1)^2+tmp(2)^2+tmp(3)^2); %rendre le vecteur unitaire en divisant par la norme
endfunction
