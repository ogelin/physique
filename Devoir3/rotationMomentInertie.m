function momentInertieApres = rotationMomentInertie(theta, momentInertieAvant)
  R = matriceRotationY(theta); 
  momentInertieApres = R * momentInertieAvant * transpose(R);
endfunction
