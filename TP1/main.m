clear all;  %clear the memory
clc;    %clear console text

% Inputs

posA_x = 0;
posA_y = 0;
posA_z = 0;

va_x = 0;
va_y = 0;
va_z = 0;

Force_md = 0;
Force_mg = 0;
Force_p = 0;

posA=[posA_x;posA_y;posA_z];
ar = 0;
va=[va_x;va_y;va_z];
Forces=[Force_md Force_mg Force_p];

#Cas 1

#calcul de la position du nez pour le cas 1.[26.70, 0,2.4850]

longueurFuselage = 22.95;
hauteurCabine = 3.82;
positionX = longueurFuselage+hauteurCabine;

largeurAile = 1.14;
rayonFuselage = 1.345;
positionZ = largeurAile + rayonFuselage;

reponseDevoir1_cas1 = Devoir1([positionX, 0, positionZ],0,0,[11,11,260])




