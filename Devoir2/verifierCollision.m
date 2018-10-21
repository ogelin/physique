function [but] = verifierCollision (qn)

#La mesure 0.11 est le rayon du ballon

# Il y a un but du côté gauche

printf("verifierCollision**************************************************\n");

printf('qn\n');
disp(qn(1));
disp(qn(2));
disp(qn(3));

printf('(qn(1) < 0) && (17.5 < qn(2) < 24.820) && (0 < qn(3) < 2.44)\n');
disp((qn(1) < 0) && (17.5 < qn(2) < 24.820) && (0 < qn(3) < 2.44));

if ((qn(1) < 0) && (17.5 < qn(2) < 24.820) && (0 < qn(3) < 2.44))
printf('but = 1\n');
disp('1');
but = 1;


# Il y a un but du côté droit
elseif (qn(1) > 120 && (17.5 + 0.11) < qn(2) < (24.820 - 0.11) && 0 < qn(3) < (2.44 - 0.11))
printf('but = 1\n');
disp('1');
but = 1;


# Le ballon touche le sol en premier
elseif (qn(3) <= 0.11)
printf('but = 0\n');
but = 0;


# Le ballon touche les montants du buts gauche
# Poteau proche de l'origine
elseif ( (qn(1) == 0) && ( (17.5 - 0.11) <= qn(2) <= (17.5 + 0.11) )&& 0 < qn(3) < (2.44 - 0.11) )
printf('but = -1\n');
printf('but gauche 1');

but = -1;


# Le ballon touche les montants du buts gauche
# Poteau loin de l'origine
elseif ( (qn(1) == 0) && ((24.820 - 0.11) <= qn(2) <= (24.820 - 0.11)) && 0 < qn(3) < (2.44 - 0.11) )
printf('but = -1\n');
printf('but gauche 2');
but = -1;


# Le ballon touche les montants du buts gauche
# Poteau transversale
elseif ( (qn(1) == 0) && ((17.5 + 0.11) < qn(2) < (24.820 - 0.11))  && (2.44 - 0.11) <= qn(3) <= (2.44 + 0.11) )
printf('but = -1\n');
printf('but gauche 3');
but = -1;


# Le ballon touche les montants du buts droit
# Poteau proche de l'origine
elseif ( (qn(1) == 120) && ((17.5 - 0.11) <= qn(2) <= (17.5 + 0.11)) && 0 < qn(3) < (2.44 - 0.11))
printf('but = -1\n');
printf('but droit 1');
but = -1;


# Le ballon touche les montants du buts droit
# Poteau loin de l'origine
elseif ( (qn(1) == 120) && ((24.820 - 0.11) <= qn(2) <= (24.820 - 0.11)) && 0 < qn(3) < (2.44 - 0.11) )
printf('but = -1\n');
printf('but droit 2');
but = -1;


# Le ballon touche les montants du buts droit
# Poteau transversale
elseif ( (qn(1) == 120) && ((17.5 + 0.11) < qn(2) < (24.820 - 0.11))  && (2.44 - 0.11) <= qn(3) <= (2.44 + 0.11) )
printf('but = -1\n');
printf('but droit 3');
but = -1;


#Le ballon sort du terrain
#Sortie vers le haut
elseif ( 0 <= qn(1) <= 120 && 90 < qn(2) && 0.11 <= qn(3) )
printf('but = -2\n');

printf('Le ballon sort du terrain Sortie vers le haut');
but = -2;


#Le ballon sort du terrain
#Sortie vers le bas
elseif ( 0 <= qn(1) <= 120 && qn(2) < 0  && 0.11 <= qn(3) )
printf('but = -2\n');
printf('Le ballon sort du terrain Sortie vers le bas');
but = -2;


#Le ballon sort du terrain
#Sortie vers la gauche
elseif ( qn(1) < 0 && (( 0 < qn(2) < (17.5-0.11) ) || ( (24.820+0.11) < qn(2) < 90 ))  && 0.11 <= qn(2) )
printf('but = -2\n');
printf('Le ballon sort du terrain Sortie vers le gauche');
but = -2;


#Le ballon sort du terrain
#Sortie vers la droite
elseif ( 120 < qn(1) && (( 0 < qn(2) < (17.5-0.11) ) || ( (24.820+0.11) < qn(2) < 90 ))  && 0.11 <= qn(3) )
printf('but = -2\n');
printf('Le ballon sort du terrain Sortie vers le droite');
but = -2;

elseif
printf('Pas de collision');
but = -4;

endif

endfunction
