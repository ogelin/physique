function [somme] = sommeDesForces(masse, aire, vitesse)
  somme = calculForceVisqueuse(aire, vitesse) + forceGravite(masse);
 endfunction
  
