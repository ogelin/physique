classdef Constantes
    properties (Constant = true)
      
      POSITION_AVION = [0; 0; 0];
      VITESSE_AVION =  300 .*[cos(pi/18) ; 0; sin(pi/18)] .* (1000/3600)
      %(1000/3600) pour la conversion km/h -> m/s
      
      INTENSITE_SONORE = 160; #decibels
      
      POSITION_INITIALE_TRAIN = 1000 .* [10; 10; 10]
      
      VITESSE_SON = 331.3 + 0.606 * 10;
        
    end
end