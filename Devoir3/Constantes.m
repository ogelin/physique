classdef Constantes
    properties (Constant = true)
      
        %Classe contenant les constantes n�cessaires au programme. 
        %Nous sp�cifions les unit�s dans le noms des constantes lorsqu'elles pourraient �tre ambigues.
        
        %Propri�t�s de la boite
        MASSE_BOITE_kg = 0.075;
        HAUTEUR_BOITE_m = 0.015;
        RAYON_BOITE_m = 0.0061237;
        POSITION_INITIALE_BOITE_m = [3,0,10];
        
        %Propri�t�s de la balle
        RAYON_BALLE_m = 0.00335;
        MASSE_BALLE_kg = 0.058;
        POSITION_INITIALE_BALLE_m = [0,0,2];
        
        %Propri�t�s physiques
        FORCE_GRAVITATIONNELLE = 9.8; %m/s
        COEFFICIENT_FROTTEMENT = 0.1; %kg/m^2s
        COEFFICIENT_RESTITUTION = 0.5;
        
        %Coup r�ussi ou manqu�
        COUP_REUSSI = 1;
        COUP_MANQUE = 0;
        
        PRECISION_VOULUE = 0.001; %m
    end
end