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
  
  sonArrivee = false;
  premier20db = false;
  
  %Intensite;frequencerayon;position centre d'onde (aka position avion); 
  ondeSonore = [160;favion; 100; positionAvionCourante(1);positionAvionCourante(2);positionAvionCourante(3)];
  
  
  while (!fini)
       
   
    positionTrainCourante = calculerDeplacementTrain(deltaT, ...
                            positionTrainCourante,...
                            vitesseTrain);
                            
    positionAvionCourante = calculerDeplacementAvion(deltaT, ...
                                                     positionAvionCourante);
   
    nouvelleOnde = [160;favion;100; positionAvionCourante(1);positionAvionCourante(2);positionAvionCourante(3)];
    
    %Ajout d'une nouvelle colonne;
    ondeSonore = [ondeSonore nouvelleOnde];
                                                     
    
    dist = calculerDistanceEntreTrainEtAvion(positionTrainCourante,...
                                             positionAvionCourante);
    
    intensite = calculerIntensiteSonoreSelonDistance(dist, favion)
    %%sonArrivee
    %%premier20db
    %%fini 
    
    for ondeAIncremente=1:size(ondeSonore,2)
 

      if(ondeSonore(1, ondeAIncremente) > 0 && !sonArrivee)
         tps = t;
         sonArrivee = true;
      endif;
 
      if(ondeSonore(1, ondeAIncremente)  > 20 && !premier20db)
         premier20db = true
      endif
   
      if (sonArrivee) 
        nouvelleFrequence = EffetDoppler(positionTrainCourante, positionAvionCourante, vitesseTrain, favion);
        
        positionAvionEnreistree = [ondeSonore(4, ondeAIncremente), ...
                                    ondeSonore(5, ondeAIncremente), ...
                                    ondeSonore(6, ondeAIncremente) ];
                                    
        distanceTrainetPositionAvionEnregistre = calculerDistanceEntreTrainEtAvion(positionTrainCourante,...
                                                    positionAvionEnreistree);                                                
                                                    
        nouvelleIntensite = calculerIntensiteSonoreSelonDistance(distanceTrainetPositionAvionEnregistre, ...
                              nouvelleFrequence);
        
        ondeSonore(2,ondeAIncremente) = nouvelleFrequence;
        
        ondeSonore(1,ondeAIncremente) = nouvelleIntensite;
      
        sommeFrequenceDeltaT = sum(ondeSonore,[2,:])(2);
      
        sommeIntensiteDeltaT = sum(ondeSonore,[2,:])(1);
        
        %%if (ondeSonore(1, ondeAIncremente) > 20 && !premier20db )
          %% fini = true;
        %%endif; 
      
      endif; 
      
       
      
    end
        
       fTrain = [fTrain sommeFrequenceDeltaT];
       Itrain = [Itrain sommeIntensiteDeltaT];
    
     if (sommeIntensiteDeltaT < 20) 
          fini = true; 
        endif
        
        


    
  t = t+deltaT;  
  endwhile
  
  %%fTrain = [ondeSonore(2,:)];
  %%disp(fTrain)
  %%Itrain = [ondeSonore(1,:)];
  
endfunction
