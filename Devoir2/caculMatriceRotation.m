
%Fonction pas utiliser dans le code, mais je la garde au cas où


function [R] = caculMatriceRotation (wi)

%if (wi(0) == 0 && wi(1) == 0 && wi(2) ~=0)
%la matrice de rotation est donc en z

%R = [cos(wi(2)), -sin(wi(2), 0; sin(wi(2)), cos(wi(2)), 0; 0, 0, 1];


%elseif(wi(0) == 0 && wi(1) ~=0 && wi(2) ~=0)


%endif

R = [0, -wi(2), wi(1); wi(2), 0, wi(0); -wi(1), wi(0), 0];




endfunction
