function [nouvellePositionAvion] = calculerDeplacementAvion(deltaT,...
                                                       positionAvionCourante)
  
  nouvellePositionAvion = positionAvionCourante + deltaT * Constantes.VITESSE_AVION;
  
endfunction
