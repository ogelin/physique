function [tempsContact] = calculTempsContactRecepteur(positionAvionCourante, positionTrainCourante, vitesseTrain)
  %Pour alleger le calcul
  c = Constantes.VITESSE_SON;
  
  %temps pour qu'un son emis par l'avion atteigne le recepteur sur le train
  tempsContact = sqrt((vitesseTrain(1)*c - positionAvionCourante(1)).^2 + ...
                          (vitesseTrain(2)*c + positionTrainCourante(2) - positionAvionCourante(2)).^2 +...
                          (vitesseTrain(3)*c + positionTrainCourante(3) - positionAvionCourante(3)).^2)/c;
  
endfunction
