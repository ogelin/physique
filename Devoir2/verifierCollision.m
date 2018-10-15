

function [but] = verifierCollision (qn)

#La mesure 0.11 est le rayon du ballon

# Il y a un but du côté gauche
if (qn(0) < 0 && 17.5 < qn(1) < 24.820 && 0 < qn(2) < 2.44)
but = 1;


# Il y a un but du côté droit
elseif (qn(0) > 120 && (17.5 + 0.11) < qn(1) < (24.820 - 0.11) && 0 < qn(2) < (2.44 - 0.11))
but = 1;


# Le ballon touche le sol en premier
elseif (q(2) <= 0.11)
but = 0;


# Le ballon touche les montants du buts gauche
# Poteau proche de l'origine
elseif ( qn(0) = 0 &&  (17.5 - 0.11) <= qn(1) <= (17.5 + 0.11) && 0 < qn(2) < (2.44 - 0.11) )
but = -1;


# Le ballon touche les montants du buts gauche
# Poteau loin de l'origine
elseif ( qn(0) = 0 && (24.820 - 0.11) <= qn(1) <= (24.820 - 0.11) && 0 < qn(2) < (2.44 - 0.11) )
but = -1;


# Le ballon touche les montants du buts gauche
# Poteau transversale
elseif ( qn(0) = 0 && (17.5 + 0.11) < qn(1) < (24.820 - 0.11)  && (2.44 - 0.11) <= qn(2) <= (2.44 + 0.11) )
but = -1;


# Le ballon touche les montants du buts droit
# Poteau proche de l'origine
elseif ( qn(0) = 120 && (17.5 - 0.11) <= qn(1) <= (17.5 + 0.11) && 0 < qn(2) < (2.44 - 0.11))
but = -1;


# Le ballon touche les montants du buts droit
# Poteau loin de l'origine
elseif ( qn(0) = 120 && (24.820 - 0.11) <= qn(1) <= (24.820 - 0.11) && 0 < qn(2) < (2.44 - 0.11) )
but = -1;


# Le ballon touche les montants du buts droit
# Poteau transversale
elseif ( qn(0) = 120 && (17.5 + 0.11) < qn(1) < (24.820 - 0.11)  && (2.44 - 0.11) <= qn(2) <= (2.44 + 0.11) )
but = -1;


#Le ballon sort du terrain
#Sortie vers le haut
elseif ( 0 <= qn(0) <= 120 && 90 < qn(1) && 0.11 <= qn(2) )
but = -2;


#Le ballon sort du terrain
#Sortie vers le bas
elseif ( 0 <= qn(0) <= 120 && qn(1) < 0  && 0.11 <= qn(2) )
but = -2;


#Le ballon sort du terrain
#Sortie vers la gauche
elseif ( qn(0) < 0 && ( 0 < qn(1) < (17.5-0.11) ) || ( (24.820+0.11) < qn(1) < 90 )  && 0.11 <= qn(2) )
but = -2;


#Le ballon sort du terrain
#Sortie vers la droite
elseif ( 120 < qn(0) && ( 0 < qn(1) < (17.5-0.11) ) || ( (24.820+0.11) < qn(1) < 90 )  && 0.11 <= qn(2) )
but = -2;

endif

endfunction
