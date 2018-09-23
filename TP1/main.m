clear all;  %clear the memory
clc;    %clear console text

#Cas 1

#calcul de la position du nez pour le cas 1.[26.70, 0,2.4850]

longueurFuselage = 22.95;
hauteurCabine = 3.82;
positionX = longueurFuselage+hauteurCabine;

largeurAile = 0.25;
rayonFuselage = 1.345;
positionZ = largeurAile + rayonFuselage;

#reponseDevoir1_cas1 = Devoir1([positionX, 0, positionZ],0,[0,0,0],[11,11,260])
reponseDevoir1_cas2 = Devoir1([4198;0;618],0.15,[0.0; -0.003; -0.01],[8,11,260]);



