function [nouvellePosition] = calculerDeplacementTrain(deltaT,...
                                                       positionAvionCourante)
  
  nouvellePosition = positionAvionCourante + deltaT * Constantes.VITESSE_AVION;
  
endfunction
