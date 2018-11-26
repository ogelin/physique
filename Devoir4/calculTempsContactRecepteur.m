function [tempsContact] = calculTempsContactRecepteur(positionAvionCourante, positionTrainCourante, vitesseTrain)
  %Pour alleger le calcul
  c = Constantes.VITESSE_SON;
  
  %temps pour qu'un son emis par l'avion atteigne le recepteur sur le train
  
  distanceInitialeAParcourir = sqrt((positionTrainCourante(1)- positionAvionCourante(1)).^2 + ...
                          (positionTrainCourante(2) - positionAvionCourante(2)).^2 +...
                          (positionTrainCourante(3) - positionAvionCourante(3)).^2);
                          
  if (vitesseTrain(1) > 0 || vitesseTrain(2) > 0)
    tempsContact = distanceInitialeAParcourir/(c-sqrt(vitesseTrain(1)^2 + vitesseTrain(2)^2 + vitesseTrain(3)^2));
  elseif(vitesseTrain(1) <= 0 || vitesseTrain(2) < 0)
    tempsContact = distanceInitialeAParcourir/(c+sqrt(vitesseTrain(1)^2 + vitesseTrain(2)^2 + vitesseTrain(3)^2));
  endif
  
endfunction
