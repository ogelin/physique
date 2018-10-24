function [somme] = sommeDesForces(masse, aire, vitesse)
  somme = calculForceVisqueuse(aire, vitesse) + calculForceGravite(masse)
 endfunction
  
