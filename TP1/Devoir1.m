function [ pcm, MI, aa ] = Devoir1( posA,ar,va,Forces )


    fusee = fusee(posA,ar,va,Forces);
    pcm = fusee.getPositionCMOrigin();
    MI = fusee.momentInertieFusee();
    
    fprintf("momentInertieFusee : \n");
    fprintf("x = %d \n", MI(1));
    fprintf("y = %d \n", MI(2));
    fprintf("z = %d \n", MI(3));
    aa = 0;
    
    
end
