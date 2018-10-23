#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [But tf rf vf] = Devoir2 (ri, vi, wi)

ballonRayon = 0.11; # en mètre

precision = 0.001;
nCol = -4;
compteur = 0;

t0 = 0; 
deltaT = 0.01; 

But = -6;
tf = 0;
rf = 0;
vf = 0;

q0 = q(vi, ri, wi);

trajectoire = [];

while(compteur < 4)

qResultat = SEDRK4t0(q0,t0,deltaT, 'g');
rf = [qResultat(4), qResultat(5), qResultat(6)];

col = verifierCollision(rf);
nCol = col;

if(nCol!= -4)
  compteur +=1;
  t0 = t0 - deltaT;
  deltaT = deltaT/10;
  qResultat = q0;
  if((q0(5) - ballonRayon) < precision)
  compteur = 4;
  endif
endif

q0 = qResultat;
t0 = t0 + deltaT;
tf = t0;
vf = [q0(1), q0(2), q0(3)];
But = nCol;

trajectoire = [trajectoire; q0(4) q0(5) q0(6)];
sizeTrajectoire = size(trajectoire);

endwhile

genererGraphe(trajectoire, sizeTrajectoire(1));

endfunction

function genererGraphe(trajectoire, size) 
  
%dessiner la table
terrain = [[0 0 0]; [0 90 0]; [120 90 0]; [120 0 0]; [0 0 0]];
patch([0, 120, 120, 0], [0, 0, 90, 90], [0, 0, 0, 0], "g");
patch([0, 0, 0, 0], [41.35, 41.35, 48.65, 48.65], [0, 2.44, 2.44, 0], "b"); #dessine la filet gauche
patch([120, 120, 120, 120], [41.35, 41.35, 48.65, 48.65], [0, 2.44, 2.44, 0], "b");  #dessine le filet droit
   
ligneTerrain = plot3(terrain(:,1), terrain(:,2), terrain(:,3));
            
hold on
                       
X = zeros(size, 1);
Y = zeros(size, 1);
Z = zeros(size, 1);

for i = 1:size
X(i) = trajectoire(i, 1);
Y(i) = trajectoire(i, 2);
Z(i) = trajectoire(i, 3);
end
plot3(X, Y, Z); hold on
text(X(size), Y(size), Z(size), '');
xlabel('x');
ylabel('y');
zlabel('z');
title('Trajectoire du ballon');
end
