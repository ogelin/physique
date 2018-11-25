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
                                                   
    %Pour chacune de ces nouvelles ondes, on doit augmenter leur rayon et ajuster leur intensit� et fr�quence.
    for ondeAIncremente=1:size(ondeSonore,2)

        nouvelleFrequence = EffetDoppler(positionTrainCourante, positionAvionCourante, vitesseTrain, favion);
        
        positionAvionEnreistree = [ondeSonore(4, ondeAIncremente), ...
                                    ondeSonore(5, ondeAIncremente), ...
                                    ondeSonore(6, ondeAIncremente) ];
                                    
        distanceTrainetPositionAvionEnregistre = calculerDistanceEntreTrainEtAvion(positionTrainCourante,...
                                                    positionAvionEnreistree);                                                
                                                    
        nouvelleIntensite = calculerIntensiteSonoreSelonDistance(distanceTrainetPositionAvionEnregistre, ...
                              favion);
        
        
        %Ajustement de l'intensit� et de la fr�quence de l'onde
        ondeSonore(2,ondeAIncremente) = nouvelleFrequence;
        ondeSonore(1,ondeAIncremente) = nouvelleIntensite; 
       
      %On trouve le premier 20 db, ce qui nous permettra �ventuellement de faire cesser le while. 
       if(ondeSonore(1, ondeAIncremente)  > 20 && !premier20db)
          premier20db = true
       endif
      
      
    end
    
    
    %Il faut maintenant trouver la somme des fr�quences et des intensit�s percus par le train au temps deltat t
    % et placer ces r�sultats dans les matrices correspondantes.
    %J'ai un doute sur la mani�re dont on l'a fait.
    sommeIntensiteDeltaT = sum(ondeSonore,[1,:])(1); 
    sommeFrequenceDeltaT = sum(ondeSonore,[2,:])(2);
      
    fTrain = [fTrain sommeFrequenceDeltaT];
    Itrain = [Itrain sommeIntensiteDeltaT];
       
       
   %Parcours de la matrice des r�sutltats finaux, c'est � dire la somme de toutes les fr�quences et instensit�s
   % � chaque seconde pour v�rifier quand cette intensit� est devenue inf�rieure � 20 db.  Lorsque c'est le cas,
   % on doit arr�ter le while. 
   for ItrainAuTemps=1:size(Itrain,1)   
       if(Itrain(1, ItrainAuTemps)<20 && premier20db)
          fini = true;
       endif     
   end
       
    
  t = t+deltaT;  
  endwhile
  

  
endfunction
