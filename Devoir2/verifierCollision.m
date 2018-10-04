

function [but] = verifierCollision (qn)

#Le ballon entre complètement dans le but (position de son centre de masse en x = 0 m 
#pour le but de gauche et position de son centre de masse en x = 120 m pour le but de droite).
# Dans ce cas, un but est compte ́.

#Vérifier collision dans le but de gauche


#Limite du but gauche

coinButGauchePoteauProcheOrigineEnZ0 = [0, 17.5, 0];  # y = 1 + 11 + 5.5 
coinButGauchePoteauLoinOrigineEnZ0 = [0, 24.820, 0];;  # y = 1 + 11 + 5.5 +7.32
coinButGauchePoteauProcheOrigineEnZ244 = [0, 17.5, 2.44];  
coinButGauchePoteauLoinOrigineEnZ244 = [0, 24.820, 2.44];  


#Limite du but droit

coinButDroitPoteauProcheOrigineEnZ0 = [120, 17.5, 0];  # y = 1 + 11 + 5.5 
coinButDroitPoteauLoinOrigineEnZ0 = [120, 24.820, 0];;  # y = 1 + 11 + 5.5 +7.32
coinButDroitPoteauProcheOrigineEnZ244 = [120, 17.5, 2.44];  
coinButDroitPoteauLoinOrigineEnZ244 = [120, 24.820, 2.44];  


# Il y a un but du côté gauche
if (qn(0) < 0 && 17.5 < qn(1) < 24.820 && 0 < qn(2) < 2.44)
but = 1;


# Il y a un but du côté gauche
elseif (qn(0) > 120 && 17.5 < qn(1) < 24.820 && 0 < qn(2) < 2.44)
but = 1;


# Le ballon touche le sol en premier
elseif (z <= 0)
but = 0;


# Le ballon touche les montants du buts gauche
# Poteau proche de l'origine
elseif ( qn(0) = 0 && qn(1) = 17.5 && 0 < qn(2) < 2.44 )
but = -1;


# Le ballon touche les montants du buts gauche
# Poteau loin de l'origine
elseif ( qn(0) = 0 && qn(1) = 24.820 && 0 < qn(2) < 2.44 )
but = -1;


# Le ballon touche les montants du buts gauche
# Poteau transversale
elseif ( qn(0) = 0 && 17.5 < qn(1) < 24.820  && qn(2) = 2.44 )
but = -1;


# Le ballon touche les montants du buts droit
# Poteau proche de l'origine
elseif ( qn(0) = 120 && qn(1) = 17.5 && 0 < qn(2) < 2.44 )
but = -1;


# Le ballon touche les montants du buts droit
# Poteau loin de l'origine
elseif ( qn(0) = 120 && qn(1) = 24.820 && 0 < qn(2) < 2.44 )
but = -1;


# Le ballon touche les montants du buts droit
# Poteau transversale
elseif ( qn(0) = 120 && 17.5 < qn(1) < 24.820  && qn(2) = 2.44 )
but = -1;


#Le ballon sort du terrain
#Touché loin de l'origine
elseif ( 0 <= qn(0) <= 120 && 190 < qn(1) && 0 < qn(2) )
but = -2;


#Le ballon sort du terrain
#Touché loin de l'origine
elseif ( 0 <= qn(0) <= 120 && qn(1) < 0  && 0 < qn(2) )
but = -2;


#Le ballon sort du terrain
#Corner côté gauche
elseif ( qn(0) < 0 && ( 0 < qn(1) < 17.5 ) || ( 24.820 < qn(1) < 90 )  && 0 <= qn(2) )
but = -2;


#Le ballon sort du terrain
#Corner côté droit
elseif ( 120 < qn(0) && ( 0 < qn(1) < 17.5 ) || ( 24.820 < qn(1) < 90 )  && 0 <= qn(2) )
but = -2;

endfunction
