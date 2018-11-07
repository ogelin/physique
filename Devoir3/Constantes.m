classdef Constantes
    properties (Constant = true)
      
        %Classe contenant les constantes nécessaires au programme. 
        %Nous spécifions les unités dans le noms des constantes lorsqu'elles pourraient être ambigues.
        
        %Propriétés de la boite
        MASSE_BOITE_kg = 0.075;
        HAUTEUR_BOITE_m = 0.15;
        RAYON_BOITE_m = 0.061237;
        POSITION_INITIALE_BOITE_m = [3,0,10];
        
        %Propriétés de la balle
        RAYON_BALLE_m = 0.035;
        MASSE_BALLE_kg = 0.058;
        POSITION_INITIALE_BALLE_m = [0,0,2];
        
        %Propriétés physiques
        FORCE_GRAVITATIONNELLE = 9.8; %m/s
        COEFFICIENT_FROTTEMENT = 0.1; %kg/m^2s
        COEFFICIENT_RESTITUTION = 0.5;
        
        %Coup réussi ou manqué
        COUP_REUSSI = 1;
        COUP_MANQUE = 0;
        
        %Lieu de la collision 
        COLLISION_BASE = 2; %Collision avec le cercle sur le dessus ou dessous du cylindre
        COLLISION_COTE = 3; %Collision avec le mur vertical du cylindre
        COLLISION_ARETE = 4; %Collision où la base et le cote se rejoignent
        
        PRECISION_VOULUE = 0.001; %m
    end
end