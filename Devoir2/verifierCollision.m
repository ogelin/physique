

function [but] = verifierCollision (qn)


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

endif

endfunction
