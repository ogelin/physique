function [nouvellePosition] = calculerDeplacementTrain(deltaT,...
                                                       positionTrainCourante,...
                                                       vitesseTrain)
  
  nouvellePosition = positionTrainCourante + deltaT * vitesseTrain;
  
endfunction
