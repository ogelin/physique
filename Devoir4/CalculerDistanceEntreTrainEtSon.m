function distanceTrainEtSon = CalculerDistanceEntreTrainEtSon (positionTrainCourante, vitesseTrain, tempsPremierContact)
  distanceTrainEtSon = positionTrainCourante + vitesseTrain * tempsPremierContact;
endfunction
