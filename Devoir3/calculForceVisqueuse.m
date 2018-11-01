function [force] = calculForceVisqueuse(aire, vitesse)
  force = Constantes.COEFFICIENT_FROTTEMENT * aire .* vitesse;
endfunction
