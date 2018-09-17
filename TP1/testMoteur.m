clear all;
clc;


c = moteur(3.68,0.724,1.7, [5,0.724 + 1.345,0.25 + 1.345]);



c.obtenirLongueur();

c.obtenirRayon();

c.obtenirMasse();


position = c.obtenirPositionMoteurGauche();
fprintf("x = %d \n", position(1));
fprintf("y = %d \n", position(2));
fprintf("z = %d \n", position(3));

fprintf("\n");
position = c.obtenirPositionOrigineGauche();
fprintf("x = %d \n", position(1));
fprintf("y = %d \n", position(2));
fprintf("z = %d \n", position(3));
fprintf("\n");

c = moteur(3.68,0.724,0.724, [5,-0.724 - 1.345,0.25 + 1.345]);

c.obtenirLongueur();

c.obtenirRayon();

c.obtenirMasse();

position = c.obtenirPositionMoteurDroite();
fprintf("x = %d \n", position(1));
fprintf("y = %d \n", position(2));
fprintf("z = %d \n", position(3));

fprintf("\n");
position = c.obtenirPositionOrigineDroite();
fprintf("x = %d \n", position(1));
fprintf("y = %d \n", position(2));
fprintf("z = %d \n", position(3));