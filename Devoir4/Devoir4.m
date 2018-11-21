function [tps fTrain Itrain] = Devoir4(vtrainkmh, favion)
  %Devoir4
  contactSonore = false;
  vitesseTrain = vtrainkmh * (1000/3600);
  
  #detecter premier contact sonore
  fini = false;
  
  deltaT = 1; #secondes
  
  t = 0;
  positionTrainCourante = Constantes.POSITION_INITIALE_TRAIN;
  positionAvionCourante = Constantes.POSITION_AVION;
  
  sonArrivee = false
  
  premier20db = false
  
  while (!fini)
       
   
    positionTrainCourante = calculerDeplacementTrain(deltaT, ...
                            positionTrainCourante,...
                            vitesseTrain);
                            
    positionAvionCourante = calculerDeplacementAvion(deltaT, ...
                                                     positionAvionCourante);
    
    dist = calculerDistanceEntreTrainEtAvion(positionTrainCourante,...
                                             positionAvionCourante);
    
    intensite = calculerIntensiteSonoreSelonDistance(dist, favion)
    sonArrivee
    premier20db
    fini 
    
    if(intensite > 0 && !sonArrivee)
       tps = t;
       sonArrivee = true;
    endif;
 
    if(intensite  > 20 && !premier20db)
       premier20db = true
    endif
   
   if (sonArrivee) 
     EffetDoppler(positionTrainCourante, positionAvionCourante, vitesseTrain, favion);
      
     if (intensite <20 && premier20db)
       fini = true;
     endif; 
      
    endif; 
    
  t = t+deltaT;  
  endwhile
  
  fTrain = [];
  Itrain = [];
  
endfunction
