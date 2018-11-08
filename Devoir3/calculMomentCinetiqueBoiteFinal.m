function [MC] = calculMomentCinetiqueBoiteFinal(momentCinetiqueInitial,positionBoiteAvantCollision, impulsion)
  crossProduct = cross(positionBoiteAvantCollision, impulsion);
  MC = momentCinetiqueInitial + crossProduct;
endfunction
