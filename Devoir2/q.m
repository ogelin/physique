
%⃗q(t)=􏱵vc,x(t),vc,y(t),vc,z(t),xc(t),yc(t),zc(t),ωx,ωy,ωz,R0(t),R1(t),R2(t),R3(t)􏱶T



function [qent] = q (vitesse, position, vitesseAngulaire, R)

qent = [vitesse(0), vitesse(1), vitesse(2), position(0), position(1); position(2); vitesseAngulaire(0); vitesseAngulaire(1); vitesseAngulaire(2); R(0); R(1); R(2); R(3)];

endfunction
