function [but] = verifierCollision (qn)

#La mesure 0.11 est le rayon du ballon

# Il y a un but du côté gauche

if ((qn(1) < 0) && (41.35 < qn(2)) && (qn(2) < 48.65) && (0 < qn(3)) && (qn(3) < 2.44))
but = 1;


# Il y a un but du côté droit
elseif ((qn(1) > 120) && ((41.35 + 0.11) < qn(2)) && (qn(2) < (48.65 - 0.11)) && ((0 < qn(3)) && ( qn(3) < (2.44 - 0.11))))
but = 1;


# Le ballon touche le sol en premier
elseif (qn(3) < 0.11)
but = 0;


# Le ballon touche les montants du buts gauche
# Poteau proche de l'origine
elseif ( ((0 - 0.11) <= qn(1)) && (qn(1) <= (0 + 0.11)) && ( (41.35 - 0.11) <= qn(2) ) && (qn(2) <= (41.35 + 0.11) )&& (0 < qn(3)) && (qn(3) < (2.44 - 0.11)))
printf("poteau gauche proche");
but = -1;


# Le ballon touche les montants du buts gauche
# Poteau loin de l'origine
elseif ( ((0 - 0.11) <= qn(1)) && (qn(1) <= (0 + 0.11)) && ((48.65 - 0.11) <= qn(2) ) && ( qn(2) <= (48.65 - 0.11)) && (0 < qn(3)) (qn(3) < (2.44 - 0.11) ))
but = -1;


# Le ballon touche les montants du buts gauche
# Poteau transversale
elseif ( ((0 - 0.11) <= qn(1)) && (qn(1) <= (0 + 0.11)) && ((41.35 + 0.11) <= qn(2) ) && ( qn(2) <= (48.65 - 0.11))  && ((2.44 - 0.11) <= qn(3)) && ( qn(3) <= (2.44 + 0.11) ))
but = -1;


# Le ballon touche les montants du buts droit
# Poteau proche de l'origine
elseif ( ((120 - 0.11) <= qn(1)) && (qn(1) <= (120 + 0.11)) && ((41.35 - 0.11) <= qn(2) ) && ( qn(2) <= (41.35 + 0.11)) && (0 < qn(3) ) && (qn(3) < (2.44 - 0.11)))
but = -1;


# Le ballon touche les montants du buts droit
# Poteau loin de l'origine
elseif ( ((120 - 0.11) <= qn(1)) && (qn(1) <= (120 + 0.11)) && ((48.65 - 0.11) <= qn(2)) && ( qn(2) <= (48.65 - 0.11)) && (0 < qn(3)) && (qn(3) < (2.44 - 0.11) ))
but = -1;


# Le ballon touche les montants du buts droit
# Poteau transversale
elseif ( ((120 - 0.11) <= qn(1)) && (qn(1) <= (120 + 0.11)) && ((41.35 + 0.11) <= qn(2)) && (qn(2) <= (48.65 - 0.11))  && ((2.44 - 0.11) <= qn(3)) && (qn(3) <= (2.44 + 0.11)))
but = -1;


#Le ballon sort du terrain
#Sortie vers le haut
elseif ( 0 <= qn(1) && qn(1) <= 120 && 90 < qn(2) && 0.11 <= qn(3) )
but = -2;


#Le ballon sort du terrain
#Sortie vers le bas
elseif ( 0 <= qn(1) && qn(1) <= 120 && qn(2) < 0  && 0.11 <= qn(3) )
but = -2;


#Le ballon sort du terrain
#Sortie vers la gauche
elseif ( qn(1) < 0 && ((( 0 < qn(2) ) && (qn(2) < (41.35-0.11) )) || (( (48.65+0.11) < qn(2)) && ( qn(2) < 90 )))  && 0.11 <= qn(3) )
but = -2;

#Le ballon sort du terrain
#Sortie vers la gauche au dessus du but
elseif ( qn(1) < 0 && (((41.35-0.11) < qn(2) ) && qn(2) < (48.65 + 0.11)) && ((2.44 + 0.11) <= qn(3)))
but = -2;

#Le ballon sort du terrain
#Sortie vers la droite
elseif ( 120 < qn(1) && ((( 0 < qn(2)) && (qn(2) < (41.35-0.11) )) || (( (48.65+0.11) < qn(2) ) && ( qn(2) < 90 )))  && 0.11 <= qn(3) )
but = -2;

#Le ballon sort du terrain
#Sortie vers la droite au dessus du but
elseif ( 120 < qn(1) && (((41.35-0.11) < qn(2) ) && qn(2) < (48.65 + 0.11)) && ((2.44 + 0.11) <= qn(3)) )
but = -2;

else
but = -4;

endif

endfunction
