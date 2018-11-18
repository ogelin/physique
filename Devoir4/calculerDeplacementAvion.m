function [nouvellePosition] = calculerDeplacementAvion(deltaT,...
                                                       positionAvionCourante)
  
  nouvellePosition = positionAvionCourante + deltaT * Constantes.VITESSE_AVION;
  
endfunction
