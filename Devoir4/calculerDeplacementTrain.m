function [nouvellePositionTrain] = calculerDeplacementTrain(deltaT,...
                                                       positionTrainCourante,...
                                                       vitesseTrain)
  
  nouvellePositionTrain = positionTrainCourante + deltaT * vitesseTrain
  
endfunction
