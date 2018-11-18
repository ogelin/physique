function [tps fTrain Itrain] = Devoir4(vtrainkmh, favion)
  %Devoir4
  contactSonore = true;
  vitesseTrain = vtrainkmh * (1000/3600);
  
  #detecter premier contact sonore
  fini = false;
  
  deltaT = 0.001; #secondes
  
  t = 0;
  positionTrainCourante = Constantes.POSITION_INITIALE_TRAIN;
  positionAvionCourante = Constantes.POSITION_AVION;
  
  while (!fini)
       
   
    positionTrainCourante = calculerDeplacementTrain(deltaT, ...
                            positionTrainCourante,...
                            vitesseTrain);
    positionAvionCourante = calculerDeplacementAvion(deltaT, positionAvionCourante);
    dist = calculerDistanceEntreTrainEtAvion(positionTrainCourante, positionAvionCourante);
    
    contactSonore = verifierContactSonore();
   
    if (contactSonore) 
      intensite = calculerIntensiteSonoreSelonDistance();
      EffetDoppler();
      
      if (intensite > 20)
        fini = true;
      endif;
    endif; 
    
  t = t+deltaT;  
  endwhile
  
  
  
endfunction
