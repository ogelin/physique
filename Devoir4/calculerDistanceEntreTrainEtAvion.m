function dist = calculerDistanceEntreTrainEtAvion(positionTrain, positionAvion) 
    
    dist = sqrt((positionTrain(1)-positionAvion(1))^2 ...
                              +(positionTrain(2)-positionAvion(2))^2 ...
                              +(positionTrain(3)-positionAvion(3))^2);
                              
endfunction