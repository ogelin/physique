function [MC] = calculMomentCinetiqueBoiteInitial(momentInertieBoite, vitesseAngulaireBoiteAvantCollision)
  MC = momentInertieBoite*vitesseAngulaireBoiteAvantCollision;
endfunction
