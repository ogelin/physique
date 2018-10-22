

function [positionBallon] = forceGravite ()

ballonMasse = 0.45; # en kg
  
positionBallon = [0;0;ballonMasse*-9.8];

endfunction
