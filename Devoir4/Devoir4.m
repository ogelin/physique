function [tps fTrain Itrain] = Devoir4(vtrainkmh, favion)
  %Devoir4
  contactSonore = true;
  
  #detecter premier contact sonore
  fini = false;
  
  while (!fini)
   
    calculerDeplacementTrain();
    calculerDeplacementAvion();
    calculerDistanceEntreTrainEtAvion();
    
    contactSonore = verifierContactSonore();
   
    if (contactSonore) 
      intensite = calculerIntensiteSonoreSelonDistance();
      EffetDoppler();
      
      if (intensite > 20)
        fini = true;
      endif;
    endif; 
    
    
  endwhile
  
  
  
endfunction
