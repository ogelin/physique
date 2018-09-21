function [ pcm, MI, aa ] = Devoir1(posA,ar,va,Forces )


    avion = avion(posA,ar,va,Forces);
    pcm = avion.getPositionCMATerre();
    MI = avion.momentInertieAvionOrigine()
    
   # fprintf("Moment inertie totale :");
    #disp(MI);
    
    #fprintf("momentInertieAvionOrigine : \n");
    #fprintf("x = %d \n", MI(1));
   # fprintf("y = %d \n", MI(2));
    #fprintf("z = %d \n", MI(3));
    aa = 0;
    
    
end
