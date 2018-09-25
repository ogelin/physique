function x = Devoir1(posA,ar,va,Forces )


    avion = avion(posA,ar,va,Forces);
    pcm = [avion.getPositionCM()(1); avion.getPositionCM()(2); avion.getPositionCM()(3)]
    MI = avion.momentInertieAvionOrigine()
    
    
    #trouver la position de la force 1
    matriceRotation = avion.calculMatriceRotationAvion(ar);
    positionForce1 = avion.calculPositionForce1(ar);
    positionForce2 = avion.calculPositionForce2(ar);
    positionForce3 = avion.calculPositionForce3();
    
    tau = avion.calculTau(positionForce1, positionForce2, positionForce3, Forces);
    
    
    aa = avion.caculAccelerationAngulaire(va, MI, tau)
    
    x = [ pcm, MI, aa ] ;
    
    
    
end







