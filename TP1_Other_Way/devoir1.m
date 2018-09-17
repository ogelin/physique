function [ pcm MI aa ] = Devoir1( posA,ar,va,Forces )
    pcm = calculatePcm(posA);
    MI = calculateMI();
    aa = calculateAA();
end
