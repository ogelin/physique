
function [a] = acceleration (forces)

ballonMasse = 0.45; # en kg

a = forces .* ballonMasse;

endfunction
