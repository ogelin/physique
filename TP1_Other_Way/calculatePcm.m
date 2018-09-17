function [ pcm ] = calculatePcm(posA)
    % Cette fonction calcule le pcm de l'avion dans l'espace en fonction de la position du nez de l'avion.

    distanceNoseFromPlaneOrigin = [3.82 + 22.95; 0; 1.345 + 0.25];

    pcm = (distanceFromPlaneOrigin - pcmRefPlane()) + posA;     % a verifier
end

function [ pcm ] = pcmRefPlane()
    % Cette fonction calcule le pcm dans le referentiel de l'avion

    cabinMass = 0.7;
    fuselageMass = 15.1;
    wingMass = 3.25;
    finMass = 0.5;
    engineMass = 1.7;
    
    totalMass = cabinMass + fuselageMass + 2 * wingMass + finMass + 2 * engineMass;

    pcm = weightedPcm(pcmCabin(), totalMass, cabinMass) 
        + weightedPcm(pcmFuselage(), totalMass, fuselageMass)
        + weightedPcm(pcmLeftWing(), totalMass, wingMass)
        + weightedPcm(pcmRightWing(), totalMassm, wingMass)
        + weightedPcm(pcmFin(), totalMass, finMass)
        + weightedPcm(pcmLeftEngine(), totalMass, engineMass)
        + weightedPcm(pcmRightEngine(), totalMass, engineMass);
end

function [weightedPcm] weightedPcm(pcm, totalMass, specificMass)

    weightedPcm = pcm * (specificMass / totalMass);
end    

function [pcmRefPlane] = pcmRightWing()
    %calcul le pcm d'une aile dans le systeme de coordonnees de l'avion

    pcmRefRightWing = [0; -(10.6/2); 1.14/2];
    distanceFromPlaneOrigin = [10.54; 0; 0];

    pcmRefPlane = pcmRefRightWing + distanceFromPlaneOrigin;
end

function [pcmRefPlane] = pcmLeftWing()
    %calcul le pcm d'une aile dans le systeme de coordonnees de l'avion

    pcmRefLeftWing = [0; 10.6/2; 1.14/2];
    distanceFromPlaneOrigin = [10.54; 0; 0];

    pcmRefPlane = pcmRefLeftWing + distanceFromPlaneOrigin;
end

function [pcmRefPlane] = pcmFin()
    %calcul le pcm d'un aileron dans le systeme de coordonnees de l'avion
    pcmRefFin = [1.28/2; 0; 0];
    distanceFromPlaneOrigin = [0; 0; 1.345+0.25+(2.1/2)];

    pcmRefPlane = pcmRefFin + distanceFromPlaneOrigin;
end

function [pcmRefPlane] = pcmFuselage()
    %calcul le pcm du fuselage dans le systeme de coordonnees de l'avion

    pcmRefEngine = [22.15/2; 0; 0];
    distanceFromPlaneOrigin = [0; 0 ; 1.345+0.25];

    pcmRefPlane = pcmRefEngine + distanceFromPlaneOrigin;
end

function [] = pcmRightEngine()
    %calcul le pcm d'un moteur dans le systeme de coordonnees de l'avion

    pcmRefEngine = [3.68/2; 0; 0];
    distanceFromPlaneOrigin = [5; -(1.345+0.724); 1.345+0.25];

    pcmRefPlane = distanceFromPlaneOrigin + pcmRefEngine;
end

function [pcmRefPlane] = pcmLeftEngine()
    %calcul le pcm d'un moteur dans le systeme de coordonnees de l'avion

    pcmRefEngine = [3.68/2; 0; 0];
    distanceFromPlaneOrigin = [5; 1.345+0.724; 1.345+0.25];

    pcmRefPlane = distanceFromPlaneOrigin + pcmRefEngine;
end

function [pcmRefPlane] = pcmCabin()
    % calcul le pcm de la canine de pilotage dans le systeme de coordonnees de l'avion

    pcmRefCabin = [0; 0; 3*3.82/4];
    distanceFromPlaneOrigin = [22.95; 0; 1.345+0.25]; % Pour z, on additionne le rayon du fuselage a l'epaisseur des ailes

    pcmRefPlane = distanceFromPlaneOrigin + [pcmRefCabin(3); pcmRefCabin(1); pcmRefCabin(2)]; 
end
