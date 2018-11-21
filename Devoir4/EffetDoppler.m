function [frequenceRecepteur] = EffetDoppler(positionRecepteur, positionSource,vitesseTrain, fSource)
  %Pour savoir la direction de l'onde
  %Chapitre 8, page 29
  distance = positionRecepteur - positionSource;
  vecUnitaire = distance / norm(distance);
  
  
  %Pour trouver la freq recepteur
  frequenceRecepteur = (Constantes.VITESSE_SON - dot(vitesseTrain, (vecUnitaire))) ...
                       / (Constantes.VITESSE_SON - dot(Constantes.VITESSE_AVION, (vecUnitaire))) * fSource
  
endfunction
