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
   
    nouvelleOnde = [160;favion;100; positionAvionCourante(1);positionAvionCourante(2);positionAvionCourante(3)];
    
    %Ajout de la nouvelle onde dans la matrice;
    ondeSonore = [ondeSonore nouvelleOnde];
                                                   
    %Pour chacune de ces nouvelles ondes, on doit augmenter leur rayon et ajuster leur intensité et fréquence.
    for ondeAIncremente=1:size(ondeSonore,2)

        nouvelleFrequence = EffetDoppler(positionTrainCourante, positionAvionCourante, vitesseTrain, favion);
        
        positionAvionEnreistree = [ondeSonore(4, ondeAIncremente), ...
                                    ondeSonore(5, ondeAIncremente), ...
                                    ondeSonore(6, ondeAIncremente) ];
                                    
        distanceTrainetPositionAvionEnregistre = calculerDistanceEntreTrainEtAvion(positionTrainCourante,...
                                                    positionAvionEnreistree);                                                
                                                    
        nouvelleIntensite = calculerIntensiteSonoreSelonDistance(distanceTrainetPositionAvionEnregistre, ...
                              favion);
        
        
        %Ajustement de l'intensité et de la fréquence de l'onde
        ondeSonore(2,ondeAIncremente) = nouvelleFrequence;
        ondeSonore(1,ondeAIncremente) = nouvelleIntensite; 
       
      %On trouve le premier 20 db, ce qui nous permettra éventuellement de faire cesser le while. 
       if(ondeSonore(1, ondeAIncremente)  > 20 && !premier20db)
          premier20db = true
       endif
      
      
    end
    
    
    %Il faut maintenant trouver la somme des fréquences et des intensités percus par le train au temps deltat t
    % et placer ces résultats dans les matrices correspondantes.
    %J'ai un doute sur la manière dont on l'a fait.
    sommeIntensiteDeltaT = sum(ondeSonore,[1,:])(1); 
    sommeFrequenceDeltaT = sum(ondeSonore,[2,:])(2);
      
    fTrain = [fTrain sommeFrequenceDeltaT];
    Itrain = [Itrain sommeIntensiteDeltaT];
       
       
   %Parcours de la matrice des résutltats finaux, c'est à dire la somme de toutes les fréquences et instensités
   % À chaque seconde pour vérifier quand cette intensité est devenue inférieure à 20 db.  Lorsque c'est le cas,
   % on doit arrêter le while. 
   for ItrainAuTemps=1:size(Itrain,1)   
       if(Itrain(1, ItrainAuTemps)<20 && premier20db)
          fini = true;
       endif     
   end
       
    
  t = t+deltaT;  
  endwhile
  

  
endfunction
