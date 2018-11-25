function [tps fTrain Itrain] = Devoir4(vtrainkmh, favion)
  %Devoir4
  contactSonore = false;
  vitesseTrain = vtrainkmh * (1000/3600);
  
  #detecter premier contact sonore
  fini = false;
  
  deltaT = 1; #secondes
  
  fTrain = [];
  Itrain = [];
  
  
  t = 0;
  positionTrainCourante = Constantes.POSITION_INITIALE_TRAIN;
  positionAvionCourante = Constantes.POSITION_AVION;
  
  %sonArrivee = false;
  premier20db = false;
  
  %Intensite;frequencerayon;position centre d'onde (aka position avion); 
  ondeSonore = [160;favion; 100; positionAvionCourante(1);positionAvionCourante(2);positionAvionCourante(3)];
  
  
  while (!fini)
       
   
    positionTrainCourante = calculerDeplacementTrain(deltaT, ...
                            positionTrainCourante,...
                            vitesseTrain);
                            
    positionAvionCourante = calculerDeplacementAvion(deltaT, ...
                                                     positionAvionCourante);
   
    distanceTrainetPositionAvion = calculerDistanceEntreTrainEtAvion(positionTrainCourante, positionTrainCourante);
    
    nouvelleFrequence = EffetDoppler(positionTrainCourante, positionAvionCourante, vitesseTrain, favion);
    Intensite = calculerIntensiteSonoreSelonDistance(distanceTrainetPositionAvion, ...
                            favion);
   
                                        
    fTrain = [fTrain nouvelleFrequence];
    Itrain = [Itrain Intensite];
                                        
           
        
     if(Intensite < 20 && premier20db)
          fini = true;
     endif                        
                             
       
     %On trouve le premier 20 db, ce qui nous permettra éventuellement de faire cesser le while. 
      if(Intensite < 20 && !premier20db)
          premier20db = true
       endif
    

  t = t+deltaT;  
  endwhile
  

  
endfunction
