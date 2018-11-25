function [tps fTrain Itrain] = Devoir4(vtrainkmh, favion)
  %Devoir4
  contactSonore = false;
  nombreDeBips = 1;
  tempsEntreBips = 1;
  vitesseTrain = vtrainkmh * (1000/3600);
  
  #detecter premier contact sonore
  fini = false;
  
  deltaT = 1; #secondes
  
  t = 0;
  positionTrainCourante = Constantes.POSITION_INITIALE_TRAIN;
  positionAvionCourante = Constantes.POSITION_AVION;
  
  %sonArrivee = false;
  premier20db = false;
  
  %Valeurs de la premiere onde captee
  tempsPremierCaptage = calculTempsContactRecepteur(positionAvionCourante, positionTrainCourante, vitesseTrain)
  positionTrainAuMomentDuCaptage = positionTrainCourante + vitesseTrain * tempsPremierCaptage;
  frenquenceCaptee = EffetDoppler(positionTrainCourante, positionAvionCourante, vitesseTrain, favion);
  distanceParcourueParSon = norm(positionTrainAuMomentDuCaptage - positionAvionCourante);
  nouvelleIntensite = calculerIntensiteSonoreSelonDistance(distanceParcourueParSon, favion);
  
  fTrain = [frenquenceCaptee];
  Itrain = [nouvelleIntensite];
  
  positionTrainAuMomentDuCaptage = calculPositionTrainAuMomentDuCaptage(positionTrainAuMomentDuCaptage, vitesseTrain, tempsEntreBips);
  while (!fini)
       
    ancienneIntensite = nouvelleIntensite;   
       
    t = t+deltaT;  
    
    positionTrainCourante = calculerDeplacementTrain(deltaT, ...
                            positionTrainCourante,...
                            vitesseTrain);
                            
    positionAvionCourante = calculerDeplacementAvion(deltaT, ...
                                                     positionAvionCourante);
   
    nouvelleFrequence = EffetDoppler(positionTrainCourante, positionAvionCourante, vitesseTrain, favion);
    
    distanceParcourueParSon = norm(positionTrainAuMomentDuCaptage - positionAvionCourante);
    
    nouvelleIntensite = calculerIntensiteSonoreSelonDistance(distanceParcourueParSon, favion);
    
    %Temps auquel la prochaine onde sera captee par le recepteur
    tempsProchainCaptage = calculTempsContactRecepteur(positionAvionCourante, positionTrainCourante, vitesseTrain);
    
    %Au cas ou la simulation commence en dessous de 20db
    if (!premier20db && nouvelleIntensite >= 20)
      premier20db = true;
    endif
    
    %Si la simulation fini, on ajoute les dernieres donnes au tableau
    %On ajoute les valeurs car on nous demande les dernieres valeurs juste après qu'on soit descendu en dessous de 20db
    if (premier20db && nouvelleIntensite < 20)
      fTrain(end + 1) = nouvelleFrequence;
      Itrain(end + 1) = nouvelleIntensite;
      fini = true;
    endif
    
    if (t < tempsPremierCaptage)
      fTrain(end + 1) = 0;
      Itrain(end + 1) = 0;
    endif
    
    if (t > tempsPremierCaptage)
      fTrain(end + 1) = nouvelleFrequence;
      Itrain(end + 1) = nouvelleIntensite;
      positionTrainAuMomentDuCaptage = calculPositionTrainAuMomentDuCaptage(positionTrainAuMomentDuCaptage, vitesseTrain, tempsEntreBips);
    endif
    
    % Si l'intensite captee diminue alors qu'on a pas atteint 20db
    % on sort de la simulation
    if (!premier20db && nouvelleIntensite < ancienneIntensite)
      break;
    endif
   
   
  endwhile
  
  tps = tempsPremierCaptage;
  

  
endfunction
