

function qs=SEDRK4t0(q0,t0,Deltat,g)
% Solution equations differentielles par methode de RK4
% Equation a resoudre : dq/dt=g(q,t)
% avec
%   qs        : solution [q(to+Deltat)]
%   q0        : conditions initiales [q(t0)]
%   Deltat    : intervalle de temps
%   g         : membre de droite de ED. 
%               C'est un m-file de matlab
%               qui retourne la valeur de g au temps choisi

printf("SEDRK4t0 **************************************************\n");
k1=feval('g',q0,t0);
printf("SEDRK4t0 after k1**************************************************\n");
printf('k1');
disp(k1);


printf("SEDRK4t0 pour x**************************************************\n");
k2=feval(g,q0+k1*Deltat/2,t0+Deltat/2);
k3=feval(g,q0+k2*Deltat/2,t0+Deltat/2);
k4=feval(g,q0+k3*Deltat,t0+Deltat);
qPositionX=q0(7)+Deltat*(k1+2*k2+2*k3+k4)/6;
qPositionY=q0(8)+Deltat*(k1+2*k2+2*k3+k4)/6;
qPositionZ=q0(9)+Deltat*(k1+2*k2+2*k3+k4)/6;

%q(vitesse, vitesseAngulaire, position)
qs = q(qPositionX, qPositionY, qPositionZ);
printf('qs');
disp(qs);

