#fonction qui appel d'autres fonctions permettant de trouvers les réponses pour les 5 simulations.

function [Reponse] = Devoir2 (ri, vi, wi)

ballonRayon = 0.11; # en mètre

precision = 0.001;
nCol = -4;

t0 = 0; 
deltaT = 0.01; 

F = sommeDesForces(vi, wi);
printf("sommeDesForces\n");
disp(F);

a = acceleration(F);
printf("acceleration\n");
disp(a);
But = -6;
tf = 0;
rf = 0;
vf = 0;

printf("wi");
disp(wi);

printf("vi");
disp(vi);

printf("ri");
disp(ri);

q0 = q(ri, vi, a, wi);
vi = [q0(4), q0(5), q0(6)];


printf("q0");
disp(q0);

trajectoire = [];

while(nCol == -4)

printf("Devoir2**************************************************\n");
%printf('q0 dans le while devoir2');
%disp(q0);
%qResultatPositionX = SEDRK4t0(positionX,t0,deltaT,gx);
qResultat = SEDRK4t0(q0,t0,deltaT, 'g');

col = verifierCollision(qResultat);
nCol = col;

q0 = qResultat; 
t0 = t0 + deltaT;
tf = t0;
rf = [q0(1), q0(2), q0(3)];
vf = [q0(4), q0(5), q0(6)];
But = nCol;

trajectoire = [trajectoire; q0(1) q0(2) q0(3)];
sizeTrajectoire = size(trajectoire);

endwhile

genererGraphe(trajectoire, sizeTrajectoire(1));

Reponse = [But, tf, rf, vf];

endfunction

function genererGraphe(trajectoire, size) 
  
%dessiner la table
terrain = [[0 0 0]; [0 90 0]; [120 90 0]; [120 0 0]; [0 0 0]];
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
