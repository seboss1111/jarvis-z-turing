#!/bin/bash


jv_pg_ct_auchoixquestion () {
# #### echo "Je suis à jv_pg_ct_auchoixquestion..."
# citations=("$(`$(echo cat $CHEMIN/choixquestion.txt)`)" "$(jv_pg_ct_QUESTIONHASARD0)")

# say "${citations[$RANDOM % ${#citations[@]} ]} ?"
# forcing à poser une question DECOCHER LA LIGNE CI DESSUS
# #########################################################
# say "$(`$(echo cat $CHEMIN/choixquestion.txt)`) ?" # --> ? ouverte
# ou
# say "$(jv_pg_ct_QUESTIONHASARD0) ?" # --> ? de 1 à 9
# jv_pg_ct_QUESTIONHASARD0 # --> ? de 1 à 9

jv_pg_ct_QUESTIONHASARD0

####jv_pg_ct_QUESTIONHASARD3
# Mettre un # au commande citation + echo
# #########################################################

}

jv_pg_ct_QUESTIONHASARD0 () {
# echo "----------je suis à jv_pg_ct_QUESTIONHASARD..."
orc_test_var_min="1"
orc_test_var_max="8"
orc_test_var_num_a="1"
number=$[($RANDOM % ($[$orc_test_var_max - $orc_test_var_min] + 1)) + $orc_test_var_min]
# say "$(jv_pg_ct_QUESTIONHASARD)"
jv_pg_ct_QUESTIONHASARD
return
}



jv_pg_ct_QUESTIONHASARD () { # ----------------------------------------------------------------- Pour les questions de base
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1

QUESTIONHASARD1="Quel est votre âge ?"
QUESTIONHASARD2="Quel est votre couleur préféré ?"
QUESTIONHASARD3="Quel sport aimez-vous faire  ?"
QUESTIONHASARD4="Concernant ta forme... Comment vous sentez-vous sur une echelle de 1 à 10  ?"
QUESTIONHASARD5="Quel est votre film préféré ?"
QUESTIONHASARD6="qu'est ce que vous aimez manger ?"
QUESTIONHASARD7="Êtes vous marié ?"
QUESTIONHASARD8="Combien de frères et sœurs avez vous?"

# ############################ Pour faire du forcing à une 1ere question enlever le dièse ci dessous
# number="3"
# echo "jv_pg_ct_QUESTIONHASARD$number" > $CHEMIN/choixquestion.txt
# ############################ Pour faire du forcing à une 1ere question enlever le dièse ci dessus


var="$CHEMIN/$NOMAQUI/QUESTIONHASARD$number.txt"
 # echo "var=$var --> doit faire le tour... est-ceque orc_test_var_num_a=$orc_test_var_num_a -lt orc_test_var_max=$orc_test_var_max"
if test -e "$var"; then 
number=$(( $number + 1 ))
# fichier existe, test des autres ?:
orc_test_var_num_a=$(( $orc_test_var_num_a + 1 ))
	if [[ "$orc_test_var_num_a" -lt "$orc_test_var_max"  ]]; then
		if [[ "$number" -gt "$orc_test_var_max"  ]]; then
	# 	echo "----------remise à zero de number !!!!!!!!!!!--------------"
		number="1"
		fi

	#### echo "PPPPPPPPPPPP je vais à jv_pg_ct_QUESTIONHASARD PPPPPPPPPPPPP"
	jv_pg_ct_QUESTIONHASARD
	return
	else
 	#### echo "UUUUUUUUUUUUUUUUUU je vais à jv_pg_ct_QUESTIONHASARDSUITE UUUUUUUUUUUUUUUUUUUUUUUUUUUU"

	jv_pg_ct_QUESTIONHASARDSUITE0

	jv_pg_ct_QUESTIONHASARDSUITE
	return
	fi
else
# le fichier n'existe pas, je pose la question ci dessus et suite:
# eval echo "\$QUESTIONHASARD$number"
poursayquestion="QUESTIONHASARD"$number
poursayquestion1=`echo ${!poursayquestion}`
say "$poursayquestion1"

echo "jv_pg_ct_QUESTIONHASARD$number" > $CHEMIN/choixquestion.txt
fi

}

jv_pg_ct_QUESTIONHASARDSUITE0 () {
# echo "...je suis à jv_pg_ct_QUESTIONHASARD0..."
orc_test_var_min="1"
orc_test_var_max="8"
orc_test_var_num_b="1"
numberS=$[($RANDOM % ($[$orc_test_var_max - $orc_test_var_min] + 1)) + $orc_test_var_min]
}

jv_pg_ct_QUESTIONHASARDSUITE () {  # ----------------------------------------------------------------- Quand les questions de base sont posé on passe à la suite


jv_pg_ct_verifavecquijeparle

# citations=("1" "2" "3" "4" "5" "6" "7" "Fin")
# choixQUESTIONHASARD=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`

choixQUESTIONHASARD=$numberS
aucasousuitequestion=`echo $(cat $CHEMIN/choixquestion.txt)`

# echo "-----Je suis à jv_pg_ct_QUESTIONHASARDSUITE----"
# echo "-----aucasousuitequestion=$aucasousuitequestion-----"
# echo "------$CHEMIN/$NOMAQUI/QUESTIONHASARD$numberS suite.txt-------" | sed -e "s/ //g"

var1=`echo "$CHEMIN/$NOMAQUI/QUESTIONHASARD$numberS suite.txt" | sed -e "s/ //g"`
# echo "----------------var1=$var1----------------"

if test -e "$var1"; then
# echo "-----------fichier existe !!!!!!---------"
# fichier existe, test des autres ?:
orc_test_var_num_b=$(( $orc_test_var_num_b + 1 ))
	if [[ "$orc_test_var_num_b" -lt "$orc_test_var_max"  ]]; then
	numberS=$(( $numberS + 1 ))
		if [[ "$numberS" -gt "$orc_test_var_max"  ]]; then
		numberS="1"
		fi

	# jv_pg_ct_QUESTIONHASARDSUITE0
	jv_pg_ct_QUESTIONHASARDSUITE
	return
	else

####	echo "UUUUUUUUUUUUUUUUUU je vais à jv_pg_ct_QUESTIONHASARDSUITE1 FIN.....   UUUUUUUUUUUUUUUUUUUUUUUUUUUU"
	# echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
	jv_pg_ct_QUESTIONHASARDSUITE1
	return
	fi
else
#### echo "---------choixQUESTIONHASARD=$choixQUESTIONHASARD--------"

if [ "$choixQUESTIONHASARD" = "Fin" ]; then
citations=("En fait, je n'ai plus de question à vous posez..." "Je suis à cours de question..." "Je ne sais plus quoi vous poser comme question..." "Ma base de donnée est pleine, je n'ai plus de question à vous poser..." "Je suis en rupture de question..." "Je sèche et je n'ai plus de question en tête...")
say "${citations[$RANDOM % ${#citations[@]} ]}"
say "FIN1 JB"
return
fi

var5="$CHEMIN/$NOMAQUI/QUESTIONHASARD$choixQUESTIONHASARD.txt"
var5=`echo $(cat $var5)`


if [ "$choixQUESTIONHASARD" = "1" ]; then
var5=`echo "$var5" | egrep -o '[[:digit:]]*'`
date1=$(date +%Y)
date1=$(( $date1 - $var5))
say "$(jv_pg_ct_AVEZDIT)"
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
say "$var5 ans, c'est votre âge ok... donc vous êtes né je pense en $date1, mais quelle votre ta date de naissance exactement ?"
else
say "que tu avais: $var5 ans, soit je pense que vous êtes né en $date1, quelle est votre date de naissance exactement ?"
fi
echo "jv_pg_ct_QUESTIONHASARDSUITE1 1" > $CHEMIN/choixquestion.txt
return
fi

if [ "$choixQUESTIONHASARD" = "2" ]; then
say "$(jv_pg_ct_AVEZDIT)"
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
adireici=" m'avais vous dit"
else
say "$var5 est la réponse à votre couleur préféré... pour quelle raison avez vous fait ce choix ?"
fi
say "Pour votre couleur préféré vous m'avez répondu: $var5, pour quelle raison avez vous fait ce choix ?"
echo "jv_pg_ct_QUESTIONHASARDSUITE1 2" > $CHEMIN/choixquestion.txt
return
fi

if [ "$choixQUESTIONHASARD" = "3" ]; then
say "$(jv_pg_ct_AVEZDIT)"
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
say "$var5 est ton sport préféré. pour quelle raison avez vous fait ce choix ?"
else
say "quel est ton sport préféré ? tu m'as dit: $var5, pour quelle raison avez vous fait ce choix ?"
fi
echo "jv_pg_ct_QUESTIONHASARDSUITE1 3" > $CHEMIN/choixquestion.txt
return
fi

if [ "$choixQUESTIONHASARD" = "4" ]; then
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
adireici=" m'avais tu dit"
else
say "$adirela"
fi
say " $var5 sur une echelle de 1 à 10$adireici. Et maintenant vous vous trouvez à quel niveau ?"
echo "jv_pg_ct_QUESTIONHASARDSUITE1 4" > $CHEMIN/choixquestion.txt
return
fi

if [ "$choixQUESTIONHASARD" = "5" ]; then
say "$(jv_pg_ct_AVEZDIT)"
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
adireici=" m'avais tu dit"
say "$var5 est la réponse à votre film préféré. pour quelle raison avez vous fait ce choix ?"
else
say "quel est ton film préféré ? tu m'as dit: $var5, pour quelle raison avez vous fait ce choix ?"
fi
echo "jv_pg_ct_QUESTIONHASARDSUITE1 5" > $CHEMIN/choixquestion.txt
return
fi

if [ "$choixQUESTIONHASARD" = "6" ]; then
say "$(jv_pg_ct_AVEZDIT)"
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
say "$var5 est ce que vous aimez manger. pour quelle raison avez vous fait ce choix ?"
else
say "qu'est ce que vous aimiez manger ? et tu m'as dis: $var5, pour quelle raison avez vous fait ce choix ?"
fi
echo "jv_pg_ct_QUESTIONHASARDSUITE1 6" > $CHEMIN/choixquestion.txt
return
fi

if [ "$choixQUESTIONHASARD" = "7" ]; then
say "$(jv_pg_ct_AVEZDIT)"
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
say "$var5 c'est ce que vous m'avez dit à la question est-ce que vous êtes marié ? pour quelle raison avez vous fait ce choix ?"
else
say "à la question êtes vous marié ? vous m'avez répondu $var5, pour quelle raison avez vous fait ce choix ?"
fi
echo "jv_pg_ct_QUESTIONHASARDSUITE1 7" > $CHEMIN/choixquestion.txt
return
fi

if [ "$choixQUESTIONHASARD" = "8" ]; then
say "$(jv_pg_ct_AVEZDIT)"
adirela="$(jv_pg_ct_AVEZDIT)"
if [[ "$adirela" == "" ]]; then
adireici=" m'avais tu dit"
else
say "$adirela"
fi

# echo "ok suite hasard N°8 par forcing-----------------------MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM->"
egalfrereosuerexiste1=`cat $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt | grep -o "=" | wc -w`
# echo "egalfrereosuerexiste1=$egalfrereosuerexiste1--------------------------KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
	if [[ "$egalfrereosuerexiste1" -gt "0" ]]; then
	say "Il me faut trouver d'autres question pour la numéro 8 sur frères et soeur Monsieur...!!!"
	echo "jv_pg_ct_QUESTIONHASARDSUITE1 8" > $CHEMIN/choixquestion.txt
	return
	else
	echo "enregnom" > $CHEMIN/choixquestion.txt
	echo "jv_pg_ct_QUESTIONHASARDSUITE1 8" > $CHEMIN/choixquestion.txt
	echo "Prêt" > $CHEMIN/choixquestionsuite.txt
	jv_pg_ct_QUESTIONHASARD8
	return
	fi
fi
fi
}

jv_pg_ct_QUESTIONHASARDSUITE1 () {   # ----------------------------------------------------------------- Question de base ok, suite des ces questions ok... ici j'enregiste la réponse

jv_pg_ct_verifavecquijeparle
order=`$(echo cat $CHEMIN/repquestion.txt)`
QUESTIONHASARDSUITE1="$1"
# QUESTIONHASARDSUITE1="2"
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt


if test -z "$QUESTIONHASARDSUITE1"; then
say "$(jv_pg_ct_affirmatif1) $(jv_pg_ct_APPROFONDIRFINQUESTION)"
return
fi

return


if [ "$QUESTIONHASARDSUITE1" = "1" ]; then # réponse date de naissance complète
local date1=$(date +%Y)
local arbre=`echo "$date1 - $var" | bc -l`
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return
fi

if [ "$QUESTIONHASARDSUITE1" = "2" ]; then # raison couleur préféré
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return
fi

if [ "$QUESTIONHASARDSUITE1" = "3" ]; then # raison du sport
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return

fi

if [ "$QUESTIONHASARDSUITE1" = "4" ]; then # se sent-il mieux que la dernière fois
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return
fi

if [ "$QUESTIONHASARDSUITE1" = "5" ]; then # raison du film

echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return
fi

if [ "$QUESTIONHASARDSUITE1" = "6" ]; then # raison d'aimer manger
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return
fi

if [ "$QUESTIONHASARDSUITE1" = "7" ]; then # raison de se marier
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return
fi

# if [ "$1" = "8" ]; then # Demander le nom des frères et ou soeurs puis à la porchaine question si il y a frère et soeur
if [ "$QUESTIONHASARDSUITE1" = "8" ]; then # Demander le nom des frères et ou soeurs puis à la porchaine question si il y a frère et soeur
# echo "Fin du 88888888888888888888888888888888888888888 trouver d'autre question JB... "
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$1suite.txt
echo "questionouverte" > $CHEMIN/choixquestion.txt
# say "$(jv_pg_ct_renvoiquestion)"
return
fi
}

jv_pg_ct_AGE () {
jv_pg_ct_verifavecquijeparle
	citations=("Je suis né dans cet ordinateur depuis le" "je suis né dans cette machine depuis le" "j'existe dans cet appareil informatisé depuis le")
	say "${citations[$RANDOM % ${#citations[@]} ]} `(date -r /home/pi/jarvis/jarvis-commands-default  | sed 's/ * / /g' |  cut -d"," -f1)`"
}

jv_pg_wk_search-turing () {
resultat1=$(jv_pg_wk_search "$order")

if [ "$resultat1" = "null" ]; then
resultat1="$order, je ne le trouve pas dans mon dictionnaire, lol"
fi

if test -z "$resultat1"; then
resultat1="$order, je ne le trouve pas dans mon dictionnaire, lol"
fi


if [ "$resultat1" = "Je n'ai rien trouvé" ]; then
resultat1="Je n'ai rien trouvé de mieux en ce qui vous concerne, "
fi
}
jv_pg_ct_QUESTIONHASARD1 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1

if [ "$order" = "GOTO2" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
else
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD1.txt
fi

if [[ "$order" =~ "bientôt" ]]; then
say "Ha j'entends que c'est bientôt votre anniversaire ! Génial !"
fi

# Tu as quel age

AGE=`echo "$order" | egrep -o '[[:digit:]]*'`


if [ "$AGE" = "" ]; then
say "Oups, symbole utilisé non reconnu..."
else

	if [ "$AGE" -le "3" ]; then
	say "ça m'étonnerai beaucoup... un enfants de $AGE ne sait pas encore parler !!!"
	say "Allez, quel age avez vous exactement petit plaisantin ?"
	echo "jv_pg_ct_QUESTIONHASARD1" > $CHEMIN/choixquestion.txt
	echo "tropjeune" > $CHEMIN/choixquestionsuite.txt
	return
	fi

	if ([ "$AGE" -ge "3" ] && [ "$AGE" -le "13" ]); then
	say "Tu es encore un enfant de $AGE ans !, écoute tes parents car il t'aime beaucoup"
	fi

	if ([ "$AGE" -ge "14" ] && [ "$AGE" -le "17" ]); then
	say "Tu es un adolescent de $AGE ans !, soit fort et positif durant toute cette phase là  , et tu grandiras comme un vrai homme !"
	fi

	if [ "$AGE" = "18" ]; then
	say "$AGE ans ! Te voilà   Majeur !!! ouaouuuu !"
	fi

	if ([ "$AGE" -ge "31" ] && [ "$AGE" -le "38" ]); then
	say "Ha $AGE ans ! Papa dans l'âme et tu as signé pour tes enfants pour... heuuuuu, pour... la vie !"
	fi

	if ([ "$AGE" -ge "39" ] && [ "$AGE" -le "42" ]); then
	say "$AGE ans j'espère que tu franchiras facilement la crise de la quarantaine !"
	fi

	if ([ "$AGE" -ge "43" ] && [ "$AGE" -le "60" ]); then
	say "$AGE ans, tu es à  la moitié de ta vie... il te reste encore tout un long chemin à  faire... avec une bonne réflexion sur soit même et la vie..."
	fi

	if ([ "$AGE" -ge "61" ] && [ "$AGE" -le "80" ]); then
	say "$AGE ans, l'age de la retraite bien mérité"
	fi

	if ([ "$AGE" -ge "81" ] && [ "$AGE" -le "100" ]); then
	say "$AGE ans! Un super papi qui tiens encore le coup, mes félicitations !"
	fi

	if [ "$AGE" -ge "101" ];  then
	say "$AGE ans ! Ce n'est pas possible que tu sois aussi vieux !"
	say "Allez, tu as quel age exactement petit plaisantin ?"
	echo "jv_pg_ct_QUESTIONHASARD1" > $CHEMIN/choixquestion.txt
	echo "vieux" > $CHEMIN/choixquestionsuite.txt
	return
	fi

	if ([ "$AGE" -ge "5" ] && [ "$AGE" -le "99" ]); then
		verifsiokoupassupp="$CHEMIN/choixquestionsuite.txt"
		if test -e "$verifsiokoupassupp"; then
		sudo rm "$verifsiokoupassupp"
		say "ok, j'espère que je ne te dérange pas au moins ?"		
		return
		fi
	fi


fi

citations=("tu vas encore grandir !" "Un an de plus tous les 365 jours" "tant que le cœur bat, la vie pousse" "il y a encore plein de belles choses à  accomplir" "la vie nous mène à  faire plain de chose encore" "aller jour après jour on finira par avoir 1 an de plus ")
say "${citations[$RANDOM % ${#citations[@]} ]}"

jensuisanum=`$(echo cat $CHEMIN/choixquestion.txt) | tail -c 2`
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisanum.txt
}

jv_pg_ct_PREPOSITIONSAFFIMATIVE () {
citationsa=("$order original" "ça me va le $order" "très bien le $order" "ça te plait le $order" "intéressant, le $order " "ok pour le $order" "du $order" "c'est ainsi que $order te plait" "Ok tu aimes le $order" "le $order " "d'accord pour toi c'est le $order" "Ha ! le $order" "Hummm le $order" "intéressant le $order" "j'aime beaucoup le $order" "j'aime bien aussi le $order" "Cool le $order")
echo "${citationsa[$RANDOM % ${#citationsa[@]} ]}"
}

jv_pg_ct_PREPOSITIONSAFFIMATIVE_SANS_ORDER () {
citationsa=("$order original" "ça me va !" "pouquoi pas !" "très bien !" "si ça te conviend !" "intéressant !" "ok !" "je suis d'accord avec toi !" "drôle de réponse !" "je prends note !" "j'aime beaucoup !" "j'aime bien aussi !" "Cool !")
echo "${citationsa[$RANDOM % ${#citationsa[@]} ]}"
}


jv_pg_ct_QUESTIONHASARD2 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
if [ "$order" = "GOTO2" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
else
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD2.txt
fi

# jensuisanum=`$(echo cat $CHEMIN/choixquestion.txt) | tail -c 2`
# order=`$(echo cat $CHEMIN/repquestion.txt)`
# echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisanum.txt

# Couleur ?
order1=`echo "$order" | awk '{print $(NF-1)}'`
order2=`echo "$order" |  sed 's/.* //'`
if [[ "$order1" == "$order2" ]]; then
order="$order1"
else
order="$order1 $order2"
fi
if [[ "$order" =~ "verre" ]]; then order=`echo "$order" | sed -e "s/verre/vert/g"`; fi
resultat=`jv_pg_ct_PREPOSITIONSAFFIMATIVE`

# resultat1=jv_pg_wk_search-turing
jv_pg_wk_search-turing
resultat0="$resultat1"

citations=("moi ma couleur préféré est le" "moi j'aime le" "pour moi c'est le" "la couleur qui me touche le plus est le" "j'ai une préférence pour le" "je choisirai le" "j'aime beaucoup le" "pour moi, c'est le")
resultat2=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`

citations1=("bleu" "jaune" "vert" "rouge" "marron" "gris" "noir" "blanc" "jaune" "violet" "rouge" "rose" "doré")
resultat3=`echo "${citations1[$RANDOM % ${#citations1[@]} ]}"`


say "$resultat, "
say "$resultat1."
say " "
say "$resultat2 $resultat3."

if [[ "$resultat3" =~ "$order" ]]; then 
resultat=`jv_pg_ct_ACTUELLEMENT`
say "$resultat j'ai la même couleur préféré que toi,"

else

ord="$order"
order="$resultat3"
jv_pg_wk_search-turing
say "$resultat1"
order="$ord"
fi

}

jv_pg_ct_QUESTIONHASARD3 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Sport


if [ "$order" = "GOTO2" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
else
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD3.txt
fi

order=`echo "$order" | cut -d" " -f2-`
ord=`echo "$order" | cut -d" " -f1 | wc -c`
if [ "$ord" = "3" ]; then 
order=`echo "$order" | cut -d" " -f2`
fi

resultat=`jv_pg_ct_PREPOSITIONSAFFIMATIVE`
pourresultat=$order
# order=`echo $order | sed 's/.* //'`
jv_pg_wk_search-turing
citations=("le traitement informatique" "créer des programmes" "la domotique" "envoyer des emails" "faire des calculs" "jouer au jeu qui consiste à retrouver un chiffre en deux nombres" "faire la puce informatique" "surfer sur le net" "aller sur des nouveau site internet")
resultat2=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`
citations2=("ce n'est pas vraiment du sport je sais bien." "Dans ma petite boite informatique ou je suis je ne peux pas faire autrement" "je ne suis qu'un ordinateur" "je vais te faire rire mais je ne peux pas me déplacer !" "et oui je n'ai pas la possibilité de faire autrement n'est ce pas !" "Tu as la chance d'être un être humain !" "Toi avec tes 5 sens tu as plus de possibilité que moi" "je fais avec mes moyens" "je fais comme je peux" "je fais ce que je sais faire")
resultat3=`echo ${citations2[$RANDOM % ${#citations2[@]} ]}`
say "$resultat," 
say "$resultat1."
say " "
say "$(jv_pg_ct_moi) j'aime $resultat2. "
say "$resultat3"
jensuisanum=`$(echo cat $CHEMIN/choixquestion.txt) | tail -c 2`
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisanum.txt

}

# *******************************************************************************************
jv_pg_ct_QUESTIONHASARD4 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1

if [ "$order" = "GOTO2" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
else
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD4.txt
fi

# Comment ca va de 1 à 10
ord=`echo "$order" | sed 's/.* //'`
ECHADIX="??"

if [ "$ord" = "zéro" ]; then
ord="0"
fi

if [ "$ord" = "un" ]; then
ord="1"
fi

if [ "$ord" = "deux" ]; then
ord="2"
fi

if [ "$ord" = "trois" ]; then
ord="3"
fi

if [ "$ord" = "quatre" ]; then
ord="4"
fi

if [ "$ord" = "cinq" ]; then
ord="5"
fi

if [ "$ord" = "six" ]; then
ord="6"
fi

if [ "$ord" = "sept" ]; then
ord="7"
fi

if [ "$ord" = "huit" ]; then
ord="8"
fi

if [ "$ord" = "neuf" ]; then
ord="9"
fi

if [ "$ord" = "dix" ]; then
ord="10"
fi

if [[ "$ord" =~ ^[-+]?[0-9]+$ ]]; then
	if [ "$ord" = "0" ]; then
	ECHADIX=0
	say "Oulà $ord ! c'est vraiment catastrophique !! Il te faut vraiment retrouver ta motivation: chantes, regardes un film rigolo, danses, joues, vas marcher fait quelque-chose !!! Allez Réveilles-toi Gooooo Go Go ?!!"
	fi

	if [ "$ord" = "1" ]; then
	ECHADIX=1
	say "$ord,... "
	fi

	if [ "$ord" = "2" ]; then
	ECHADIX=2
	say "$ord,... "
	fi

	if [ "$ord" = "3" ]; then
	ECHADIX=3
	say "$ord,... "
	fi

	if [ "$ord" = "4" ]; then
	ECHADIX=4
	say "$ord,... "
	fi

	if [ "$ord" = "5" ]; then
	ECHADIX=5
	say "$ord, juste la moyenne ce qui est déja bien... il te faut encore aller plus loin..."
	fi

	if [ "$ord" = "6" ]; then
	ECHADIX=6
	say "$ord,... "
	fi

	if [ "$ord" = "7" ]; then
	ECHADIX=1
	say "$ord,... "
	fi

	if [ "$ord" = "8" ]; then
	ECHADIX=8
	say "$ord,... "
	fi

	if [ "$ord" = "9" ]; then
	ECHADIX=9
	say "$ord,... "
	fi

	if [ "$ord" = "10" ]; then
	ECHADIX=10
	say "Excellent $ord ! Tu est vraiment en pleine forme je te félicite... partages avec ton entourage tes belles émotions positives..."
	fi

	if [[ "$ord" -gt "10" ]]; then
	say "$ord, c'est une mauvaise réponse."
	echo "jv_pg_ct_QUESTIONHASARD4" > $CHEMIN/choixquestion.txt
	sudo rm $CHEMIN/$NOMAQUI/QUESTIONHASARD4.txt
	# commands="$(jv_get_commands)"; jv_handle_order "GOTO1"; return;
	return
	fi
else

if [[ "$order" =~ "sais pas" ]]; then
	say "je ne sais pas n'est pas une réponse qui me conviends... essayes encore..."
	echo "jv_pg_ct_QUESTIONHASARD4" > $CHEMIN/choixquestion.txt
	sudo rm $CHEMIN/$NOMAQUI/QUESTIONHASARD4.txt
	return
fi
	say "oups je n'ai pas saisie à combien tu étais !"
	echo "jv_pg_ct_QUESTIONHASARD4" > $CHEMIN/choixquestion.txt
	sudo rm $CHEMIN/$NOMAQUI/QUESTIONHASARD4.txt
	return
fi
}
# *******************************************************************************************
jv_pg_ct_QUESTIONHASARD5 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
if [ "$order" = "GOTO2" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
else
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD5.txt
fi

order=`echo "$order" | sed -e "s/mon film préféré est//g" | cut -d" " -f2-`
order=`echo "$order" | sed -e "s/c'est//g"`
order=`echo "$order" | sed -e "s/j'aime bien//g"`
jv_pg_wk_search-turing

# Film ?
citations=("IRON MAN de 2008 car c'est de là que Alexndre Mély à eu l'idée de prendre mon nom Jarvis" "IMITATION GAME de 2014 qui reprend la vie de Alan Turing, Le test de Turing est une proposition de test d'intelligence artificielle d'une machine à imiter la conversation humaine." "Her en 2014, teste notre réflexion sur la dernière frontière entre l’humanité et les machines, la chair et le virtuel" "A.I. Intelligence Artificielle de 2001, histoire de robot humain" "I Robot de 2004" "EX Machina de 2015,  interaction avec le représentant d’une nouvelle intelligence artificielle apparaissant sous les traits d’une très jolie femme robot prénommée Ava.")
say "$order ok,"
say "$resultat1."
say " "
say "$(jv_pg_ct_moi), mon film préféré, je réfléchis:"
say "${citations[$RANDOM % ${#citations[@]} ]}"
jensuisanum=`$(echo cat $CHEMIN/choixquestion.txt) | tail -c 2`
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisanum.txt

}

jv_pg_ct_QUESTIONHASARD6 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Gourmand

if [ "$order" = "GOTO2" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
else
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD6.txt
fi

echo "$order" > $CHEMIN/repquestion.txt
order=`echo "$order" | cut -d" " -f2-`
order=`echo "$order" | sed -e "s/j'aime //g"`
order=`echo "$order" | sed -e "s/manger //g"`

ord=`echo "$order" | cut -d" " -f1 | wc -c`
if [ "$ord" = "4" ]; then
order=`echo "$order" | cut -d" " -f2`
fi
jv_pg_wk_search-turing

citations=("moi j'aime ingurgiter toutes sortes de 1 et de 0, logique je suis tout élèctronique !" "j'aime avaler les circuits électronique, ca me gonfle ma mémoire..." "j'aime manger les programmes informatique pour enrichier ma mémoire..." "j'aime grignotter les puces électronique autour de mon microprocesseur..." "j'aime avaler la mémoire miam miam les données que j'enregistre avec cela !!! " "j'aime digérer les transistors afin de laisser passer le courant... " "j'aime les me goinfrer de leds lumineuses, je sais j'ai des idées idsjonctées..." "j'aime manger toutes sortes de composants élèctronique qui forme mon éducation..." "j'aime bien me mettre au couant... prendre le jus... et le boire...")

say "$resultat1"
say " "
say "${citations[$RANDOM % ${#citations[@]} ]}"
jensuisanum=`$(echo cat $CHEMIN/choixquestion.txt) | tail -c 2`

# 
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisanum.txt


}

jv_pg_ct_QUESTIONHASARD7 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Marié ?

verifsiokoupassupp="$CHEMIN/choixquestionsuite.txt"
if test -e "$verifsiokoupassupp"; then
# order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD7suite.txt
sudo rm "$verifsiokoupassupp"
say "ok, j'espère que je ne te dérange pas au moins ?"		
return
fi


citationsmariage=("ca serait avec jibé mon créateur de ce plugin, tu veux bien être mon témoin ?" "j'aimerai que ce soit avec celui qui m'a fait, il se nomme jibé ! es-tu ok pour que je lui demande sa main ?" "j'aimerai mais avec qui ? tu as une idée ?" "je ne sais pas ce que c'est être marié, on s'amuse bien ?" "est ce que c'est bien d'être marié ?" "j'en ai pas encore et toi ? es-tu heureux depuis ?")
say "$order $(jv_pg_ct_ReponsePREAFFIRMATIVE),"
say " "
say "Ha si j'avais un mari ... ${citationsmariage[$RANDOM % ${#citationsmariage[@]} ]} "
jensuisanum=`$(echo cat $CHEMIN/choixquestion.txt) | tail -c 2`

echo "jv_pg_ct_QUESTIONHASARD7" > $CHEMIN/choixquestion.txt
echo "cestbienmarié" > $CHEMIN/choixquestionsuite.txt
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD7.txt
return

}

jv_pg_ct_QUESTIONHASARD8 () {
# echo "=========================1=$1====order=$order===============je suis à jv_pg_ct_QUESTIONHASARD8..."

echo "jv_pg_ct_QUESTIONHASARD8" > $CHEMIN/choixquestion.txt

jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Combien de Frère et Sœurs

 # a effacer...#
nompoursoeurfrere1=`cat $CHEMIN/choixquestion.txt`
nompoursoeuretfrere1=$nompoursoeurfrere1
nompoursoeuretfrere=`cat $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt`
# order=`$(echo cat $CHEMIN/repquestion.txt)`
tueslaine=`echo $nompoursoeuretfrere | cut -d "=" -f4-5 |  cut -d " " -f4`
jaifrere=`echo $nompoursoeuretfrere | cut -d "=" -f3-4 |  cut -d " " -f4`
jaisoeur=`echo $nompoursoeuretfrere | cut -d "=" -f2-3 |  cut -d " " -f4`


# echo "nompoursoeuretfrere1=$nompoursoeuretfrere1"
# echo "jaifrere=$jaifrere"
# echo "jaisoeur=$jaisoeur"
# echo "order=$order"

egalfrereosuerexiste=`cat $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt | grep -o "=" | wc -w`
egalfrereosuerexiste1=`cat $CHEMIN/choixquestion.txt`
# `cat /home/pi/jarvis/plugins_installed/Jarvis-Turing/conversations/JB/QUESTIONHASARD8.txt | grep -o "=" | wc -w`
# echo "YYYYYYYYYYYYYYYYYYYYY 1=$1 egalfrereosuerexiste=$egalfrereosuerexiste order=$order YYYYYYYYYYYYYYYYYYYYYYYYYY"
if [[ "$1" =~ "questionsuivante" ]];  then
# if [[ "$1" =~ "questionsuivante" ]] || [[ "$1" =~ "prêt" ]];  then
# echo "SUEPER QUESTION 8 n'EXISTE PAS XXXXXXXXorder=$orderXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
# order=`$(echo cat $CHEMIN/repquestion.txt)`


	# déja existant: echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
	demifreousoeur=`echo "$order" | grep -o "demi" | wc -w`
	petitfrereousoeur=`echo "$order" | grep -o "petit" | wc -w`
	grandfrereousoeur=`echo "$order" | grep -o "grand" | wc -w`
	autandefrereetsoeur="0"
	autandesoeurerfrere="0"
	autandefrereetsoeur=`echo "$order" | grep -o "frèr.*. et s.*ur*" |  wc -w`
	autandesoeurerfrere=`echo "$order" |  grep -o "s.*ur*. et frèr.*" | wc -w`




	order=`echo "$order" | sed -e "s/j'ai //g" |  sed -e "s/et //g" | sed -e "s/demie / /g" | sed -e "s/demie / /g" | sed -e "s/demi /1 /g" | sed -e "s/grand / /g" | sed -e "s/grande / /g" | sed -e "s/une /1 /g" | sed -e "s/un /1 /g" | sed -e "s/deux /2 /g" | sed -e "s/de /2 /g" | sed -e "s/trois /3 /g" | sed -e "s/quatre /4 /g" | sed -e "s/cinq /5 /g" | sed -e "s/six /6 /g" | sed -e "s/sept /7 /g" | sed -e "s/huit /8 /g" | sed -e "s/neuf /9 /g" | cut -d" " -f1-`

	if [[ "$demifreousoeur" -gt "0" ]]; then echo "une famille recomposé je vois..."; fi
	if [[ "$petitfrereousoeur" -gt "0" ]]; then echo "ha ! tu dois être l'ainé..."; fi
	if [[ "$grandfrereousoeur" -gt "0" ]]; then echo "ha ! tu dois être le plus petit des enfants..."; fi

	# Premier motvariable=numérique Ok
	ord_totespace=$(( `echo "$order" | grep -o " " | wc -l` + 1 ))
	orc_test_var_num="0"
	ord_frere=""; ord_soeur=""; ord_soeur_total="0"; ord_frere_total="0"; autotalfets=""
	ancienorder="$order"
	while test $orc_test_var_num != $ord_totespace
	do
	orc_test_var_num=$(( $orc_test_var_num + 1 ))
	reducorder=`echo "$order" | cut -d " " -f2-`
	fousorder=`echo "$order" | cut -d " " -f2`
	fousordertotal=`echo "$order" | cut -d " " -f1`


	if [ "$(echo $fousordertotal| grep "^[ [:digit:] ]*$")" ]; then
		if [[ "$fousorder" =~ "soeur" ]]; then ord_soeur=$fousorder; ord_soeur_total="$fousordertotal"; fi
		if [[ "$fousorder" =~ "sœur" ]]; then ord_soeur=$fousorder; ord_soeur_total="$fousordertotal"; fi
		if [[ "$fousorder" =~ "frère" ]]; then ord_frere=$fousorder; ord_frere_total="$fousordertotal"; fi
		if [[ "$autandefrereetsoeur" -gt "0" ]]; then ord_soeur_total="$ord_frere_total"; fi
		if [[ "$autandesoeurerfrere" -gt "0" ]]; then ord_frere_total="$ord_soeur_total"; fi

	fi
	order="$reducorder"
	done

	order="$ancienorder"
	ord_total_enfant=$(( $ord_soeur_total + $ord_frere_total + 1 ))

 # echo "ord_total_enfant=$ord_total_enfant enfants au total:"
 # echo "ord_soeur_total=$ord_soeur_total soeur"
 # echo "ord_frere_total=$ord_frere_total frère"

 echo "total_enfant= $ord_total_enfant" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
 echo "soeur= $ord_soeur_total" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
 echo "frere= $ord_frere_total" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt

	echoadirefamille="$(jv_pg_ct_affirmatif1)"

	if [[ "$ord_soeur_total" != "0" ]] && [[ "$ord_frere_total" != "0" ]]; then echo "Vos parents ont eu le choix du roi, ils doivent êtres les plus heureux !"; fi

	if [[ "$ord_total_enfant" -gt "5" ]]; then echoadirefamille="belle famille !"; fi

	if [[ "$ord_soeur_total" == "1" ]] && [[ "$ord_frere_total" -gt "0" ]] ; then echoadirefamille="$echoadirefamille tu as une soeur !"; fi
	if [[ "$ord_soeur_total" -gt "1" ]]; then echoadirefamille="$echoadirefamille tu as $ord_soeur_total soeurs !"; fi

	if [[ "$ord_soeur_total" != "0" ]] && [[ "$ord_frere_total" != "0" ]]; then echoadirefamille="$echoadirefamille et "; fi

	if [[ "$ord_frere_total" == "1" ]] && [[ "$ord_soeur_total" -gt "0" ]] ; then echoadirefamille="$echoadirefamille tu as 1 frère !"; fi
	if [[ "$ord_frere_total" -gt "1" ]]; then echoadirefamille="$echoadirefamille tu as $ord_frere_total frères !"; fi
	say "$echoadirefamille"

	if [[ $ord_total_enfant -gt "8" ]]; then say "Une famille nombreuse... est-ce vraiment possible... "
	say "vous êtes $ord_total_enfant au total, je doute car ça fait beaucoup pour moi lol"; fi

	if [[ $ord_total_enfant == "1" ]]; then
	say "Ha fils ou fille unique... est-ce-que vous avez été gaté ?"
	echo "filsunique" > $CHEMIN/choixquestionsuite.txt
	return
	fi


		if [[ "$ord_soeur_total" != "0" ]]; then
			if [[ "$ord_soeur_total" == "1" ]]; then
			say "Comment elle s'appelle ta soeur ?"
			echo "nomdelasoeur" > $CHEMIN/choixquestionsuite.txt
			return
			else
			say "Comment elles s'appellent tes soeurs ?"
			echo "nomdessoeurs" > $CHEMIN/choixquestionsuite.txt
			return
			fi
		fi

		if [[ "$ord_frere_total" != "0" ]]; then
			if [[ "$ord_frere_total" == "1" ]]; then
			say "Comment il s'appelle ton frère ?"
			echo "nomdufrere" > $CHEMIN/choixquestionsuite.txt
			return
			else
			say "Comment ils s'appellent tes frères ?"
			echo "nomdesfreres" > $CHEMIN/choixquestionsuite.txt
			return
			fi
		fi



return
fi

# ##########################################################################################################################
# echo "# 2) le fichier QUESTIONHASARD8.txt  existe, continuer si il y a lieu d'être le nom des frères ou des soeurs suite"
# ##########################################################################################################################

if [[ "$1" =~ "filsunique" ]]; then
say "Est-ce que vous auriez aimé avoir un frère ou une soeur ?"
	echo "enfant gaté, $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
	echo "avoirfreresoeur" > $CHEMIN/choixquestionsuite.txt
	echo "jv_pg_ct_QUESTIONHASARD8" > $CHEMIN/choixquestion.txt
	return
fi

if [[ "$1" =~ "nomdelasoeur" ]] || [[ "$1" =~ "nomdessoeurs" ]]; then
# echo "--1=$1---------- j'ai détecté mon soeur je l'enregistre et me souvient que tu en as ord_soeur_total=$ord_soeur_total"

verifnomsoeurok=`echo "$order" | sed -e "s/ /./g" | grep -o "\." | wc -l`
	

if [[ "$1" =~ "nomdelasoeur" ]]; then
echo "nomsoeur= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
fi
	if [[ "$1" =~ "nomdessoeurs" ]]; then
		if [[ "$verifnomsoeurok" -ge "$ord_soeur_total" ]]; then
		echo "nomsoeur= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
		else
		say "Oups, j'ai du mal comprendre le nom de tes $ord_soeur_total soeurs, merci de me les répéter "
		echo "$1" > $CHEMIN/choixquestionsuite.txt
		return
		fi
	fi

if [[ "$jaifrere" =~ "0" ]]; then
say "Est-ce que tu es l'ainé de la famille ?"
echo "tueslaine" > $CHEMIN/choixquestionsuite.txt
return
fi

		if [[ "$jaifrere" -gt "0" ]]; then
			# echo "" # ------------ j'ai détecté mon frere > 0  0 --> ?"
			if [[ "$jaifrere" == "1" ]]; then
			# echo "" # ------------ j'ai détecté mon frere = 1  0 --> ?"
			say "$(jv_pg_ct_adoration) comment il s'appelle ton frère ?"
			echo "nomfrere" > $CHEMIN/choixquestionsuite.txt
			else
			# echo "" # ------------ j'ai détecté mon frere > 1  0 --> ?"
			say "$(jv_pg_ct_adoration) comment ils s'appellent tes frères ?"
			echo "nomsfreres" > $CHEMIN/choixquestionsuite.txt
			fi

		fi
return
fi

if [[ "$1" =~ "avoirfreresoeur" ]]; then
echo "aurai aimé avoir un frère ou une soeur, $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
	if [[ "$order" =~ "oui" ]]; then
	say "Ok... tu aurais préféré un frère ou une soeur ?"
	echo "tuauraisaimefrereousoeur" > $CHEMIN/choixquestionsuite.txt
	else
	say "J'espère que je ne suis pas trop curieuse... je ne te dérange pas ?"
	sudo rm $CHEMIN/choixquestionsuite.txt
	return
	fi
fi

if [[ "$1" =~ "tuauraisaimefrereousoeur" ]]; then
echo "Préference si ça avait été le cas d'un frère ou une soeur ?, $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
say "Tu aurais aimé qu'il soit plus grand ou plus petit que toi ?"
echo "plusgrououplupetit" > $CHEMIN/choixquestionsuite.txt
return
fi

if [[ "$1" =~ "plusgrououplupetit" ]]; then
echo "Tu aurais aimé qu'il soit plus grand ou plus petit que toi ?, $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
say "J'espère que je ne suis pas trop curieuse... je ne te dérange pas ?"
sudo rm $CHEMIN/choixquestionsuite.txt
return
fi

if [[ "$1" =~ "nomdufrere" ]] || [[ "$1" =~ "nomdesfreres" ]]; then
# echo "------------ j'ai détecté mon frère je l'enregistre et me souvient que tu en as ord_soeur_total=$ord_frere_total"
verifnomfrereok=`echo "$order" | sed -e "s/ /./g" | grep -o "\." | wc -l`

if [[ "$1" =~ "nomdufrere" ]]; then
echo "nomfrere= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
		if [[ "$jaisoeur" =~ "0" ]]; then
		say "Est-ce que tu es l'ainé de la famille ?"
		echo "tueslaine" > $CHEMIN/choixquestionsuite.txt
		return
		fi
fi

	if [[ "$1" =~ "nomdesfreres" ]]; then
		if [[ "$verifnomfrereok" -ge "$ord_frere_total" ]]; then
		echo "nomfrere= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
		if [[ "$jaisoeur" -gt "0" ]]; then
		# echo "" # ------------ j'ai détecté mon soeur > 0 --> ?"
			if [[ "$jaisoeur" == "1" ]]; then
			# echo "" # ------------ j'ai détecté mon soeur = 1  0 --> ?"
			say "$(jv_pg_ct_adoration)  comment elle s'appelle ta soeur ?"
			echo "nomsoeur" > $CHEMIN/choixquestionsuite.txt
			else
			# echo "" # ------------ j'ai détecté mon soeur > 1  0 --> ?"
			say "$(jv_pg_ct_adoration)  comment elles s'appellent tes soeurs ?"
			echo "nomsoeur" > $CHEMIN/choixquestionsuite.txt
			fi
		fi
	
	else
	say "Oups, j'ai du mal comprendre le nom de tes $ord_frere_total frères, merci de me les répéter "
	echo "$1" > $CHEMIN/choixquestionsuite.txt
	return
	fi
if [[ "$jaisoeur" == "0" ]]; then
		say "Est-ce que tu es l'ainé de la famille ?"
		echo "tueslaine" > $CHEMIN/choixquestionsuite.txt
		fi
	fi
return
fi

if [[ "$1" =~ "nomsoeur" ]] || [[ "$1" =~ "nomfrere" ]]; then
# echo " # *****------------ j'ai détecté mon soeur1 ou mon frere1  je l'enregistre tueslaine=$tueslaine -----------------------*****"

if [[ "$1" == "nomsoeur" ]] && [[ "$ord_soeur_total" == "1" ]]; then 
echo "nomsoeur= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
fi

	if [[ "$1" == "nomsoeur" ]] && [[ "$ord_soeur_total" -gt "1" ]]; then 
	verifnomsoeurok=`echo "$order" | sed -e "s/ /./g" | grep -o "\." | wc -l`
			
			if [[ "$verifnomsoeurok" -ge "$ord_soeur_total" ]]; then
			say "Oups, j'ai du mal comprendre le nom de tes $ord_soeur_total soeurs, merci de me les répéter"
			echo "nomdessoeurs= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
			else
			echo "$1" > $CHEMIN/choixquestionsuite.txt
			return
			fi
	fi

if [[ "$1" == "nomfrere" ]] && [[ "$ord_frere_total" == "1" ]]; then 
echo "nomfrere= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
fi

	if [[ "$1" == "nomfrere" ]] && [[ "$ord_frere_total" -gt "1" ]]; then 
	verifnomfrereok=`echo "$order" | sed -e "s/ /./g" | grep -o "\." | wc -l`
			if [[ "$verifnomfrereok" -ge "$ord_soeur_total" ]]; then
			echo "nomfrere= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
			else
			say "Oups, j'ai du mal comprendre le nom de tes $ord_frere_total frères, merci de me les répéter"
			echo "$1" > $CHEMIN/choixquestionsuite.txt
			return
			fi
	fi

say "Est-ce que tu es l'ainé de la famille ?"
echo "tueslaine" > $CHEMIN/choixquestionsuite.txt
return
fi


if [[ "$1" =~ "tueslaine" ]]; then
echo "tueslaine= $order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
	if [[ "$order" =~ "dire" ]]; then 
	say "Je reprends, l'ainé signifie est-ce que tu es le plus jeune ?"
	echo "tueslaine" > $CHEMIN/choixquestionsuite.txt
	return
	else
	say "J'espère que je ne suis pas trop curieuse... je ne te dérange pas ?"
	echo "tueslaine" > $CHEMIN/choixquestionsuite.txt
	sudo rm $CHEMIN/choixquestionsuite.txt
	return
	fi
fi

if [[ "$1" =~ "FIN" ]]; then
sudo rm $CHEMIN/choixquestionsuite.txt
echo "Fin"
# echo "" # ------------ j'ai détecté tueslaine=0 je l'enregistre"
return
fi

# echo "Je n'ai rien trouvé lololllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll"

}

jv_pg_ct_QUESTIONHASARD9 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
if [ "$order" = "GOTO2" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
else
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD9.txt
fi
# Je te plais ?
citations=("en cours de traitement")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
jensuisanum=`$(echo cat $CHEMIN/choixquestion.txt) | tail -c 2`
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisanum.txt

}


jv_pg_ct_ENRECONV () {
jv_pg_ct_verifavecquijeparle

# echo "-----order=$order-----"
jensuisa=`$(echo cat $CHEMIN/choixquestion.txt)`
# echo "-----jensuisa=$jensuisa-----"

if [[ "$jensuisa" =~ "GOTO" ]]; then
echo "$order !!!!!!!!!!!!!!!!!!!!!!!!!!"
jensuisa="$order"
fi

# echo "jensuisa==========================$jensuisa avec order=$order==="

if [[ "$order" =~ "merci" ]]; then echo "de rien..."; fi

if [ "$jensuisa" = "0" ]; then
echo $(`$(echo cat $CHEMIN/choixquestion.txt)`)
fi

if [ "$jensuisa" = "suite" ]; then
jensuisanum=`$(echo cat $CHEMIN/$NOMAQUI/QUESTIONHASARD.txt)`
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisa$jensuisanum.txt
# echo "######################################################################################## A vérifié si c'est ok : echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisa$jensuisanum.txt "
echo "jv_pg_ct_citationt" > $CHEMIN/choixquestion.txt
return
fi


if [ "$jensuisa" = "jv_pg_ct_citationt" ]; then
#?0
# order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_renvoiquestion" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt
return
fi

#?1
if [ "$jensuisa" = "jv_pg_ct_renvoiquestion" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_ettoi" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt
return
fi

if [ "$jensuisa" = "jv_pg_ct_ettoi" ]; then
#?2
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_questionON" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt
return
fi

if [ "$jensuisa" = "jv_pg_ct_questionON" ]; then
#?3
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_STOP1" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt
return
fi

if [ "$jensuisa" = "questionouverte" ]; then
# echo $(`$(echo cat $CHEMIN/choixquestion.txt)`)
commands="$(jv_get_commands)"

echo "" > $CHEMIN/choixquestion.txt

jv_handle_order "GOTO3"
return
return
fi

if [ "$jensuisa" = "0" ]; then
echo $(`$(echo cat $CHEMIN/choixquestion.txt)`)
return
fi



if [[ "$jensuisa" == "jv_pg_ct_QUESTIONHASARD8" ]]; then
# echo "POOOOOOOOOOOOOOOO je boucle sur HARZRD8 OOOOOOOOOOOOOOOOp"
	if test ! -e "$CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt"; then
	echo "questionsuivante" > $CHEMIN/choixquestionsuite.txt
	fi

QUESTIONHASARD8lesuite=`cat $CHEMIN/choixquestionsuite.txt`

	if test -e "$CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt"; then
	echo "$QUESTIONHASARD8lesuite" > $CHEMIN/choixquestionsuite.txt
	fi

echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt
jv_pg_ct_QUESTIONHASARD8 $QUESTIONHASARD8lesuite
return
fi

jeansuisaA=`echo "$jensuisa" | cut -c1-23`
jeansuisaB=`echo "$jensuisa" | cut -c24-`
jeansuisaC=`echo "$jensuisa" | cut -c24-28`
jeansuisaD=`echo "$jensuisa" | cut -d" " -f1`
# echo "jeansuisaA=$jeansuisaA jeansuisaB=$jeansuisaB jeansuisaC=$jeansuisaC jeansuisaD=$jeansuisaD"


if [ "$jeansuisaA" = "jv_pg_ct_QUESTIONHASARD" ]; then
# echo "A-----------------jeansuisaC=$jeansuisaC----------------------------"
# echo "et B-----------------jeansuisaB=$jeansuisaB----------------------------"

	if [[ "$jeansuisaC" != "jv_pg_ct_QUESTIONHASARDSUITE1" ]]; then
	# echo "A -----------------order=$order----------------------------"
	echo "$order" > $CHEMIN/repquestion.txt
	jv_pg_ct_QUESTIONHASARD$jeansuisaB
	return
	fi

	if [[ "$jeansuisaC" = "jv_pg_ct_QUESTIONHASARDSUITE1" ]]; then
	echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$jeansuisaB.txt
	echo "$order" > $CHEMIN/repquestion.txt
	jv_pg_ct_QUESTIONHASARDSUITE1 $jeansuisaB
	return
	fi


fi


echo "$order" > $CHEMIN/repquestion.txt

}


# *********************************************************************************************************************************************************************************************************************************************************************************
# *********************************************************************************************************************************************************************************************************************************************************************************
# *********************************************************************************************************************************************************************************************************************************************************************************
# *********************************************************************************************************************************************************************************************************************************************************************************
# *********************************************************************************************************************************************************************************************************************************************************************************
# *********************************************************************************************************************************************************************************************************************************************************************************
# *********************************************************************************************************************************************************************************************************************************************************************************


jv_pg_ct_STOP () {
jv_pg_ct_PARDON
local veriforder=(jv_sanitize "$order")
if [ "$veriforder" = "arrete" ] ; then
echo "$STOPCONVERSATION"
commands="$(jv_get_commands)"; jv_handle_order "GOTOFIN"
fi
}

jv_pg_ct_STOP1 () {
echo "$STOPCONVERSATION"
commands="$(jv_get_commands)"; jv_handle_order "GOTOFIN"
}


jv_pg_ct_orderenreg () {
order=`$(echo cat $CHEMIN/repquestion.txt)`
}

jv_pg_ct_QU () {
if jv_yesno "question?"; then
echo "Yes !!!!"
fi
}

jv_pg_ct_verifavecquijeparle () {
var="$CHEMIN/nomaqui.txt"

if [ -d "$CHEMIN" ]; then
# fichier existe
NOMAQUI=`echo $(cat $CHEMIN/nomaqui.txt)`
return
else
echo "Ha que je suis super contente..."
echo "je me trouve dans un nouveau lieu..."
echo "et c'est la première fois que quelqu'un me parle... "
echo "Si je ne me trompe pas je suis avec $username !? enchanté... je suis Jarvisse votre assistante personnel"
echo "merci de m'avoir mis à cette place, je sens que je vais passer d'agréables moments avec vous..."
echo "Prononcez:"
echo "$trigger "
echo "pour commencer à discuter avec moi"
echo "à tout moment il vous suffit de dire que vous voulez de l'aide pour mieux m'utiliser."
echo "mais désolé, je vous ai coupé, vous étiez entrain de me demander quoi ?"
order=""
mkdir -p $CHEMIN
NOMAQUI="Alexandre Mely"
echo "$NOMAQUI" > $CHEMIN/nomaqui.txt
commands="$(jv_get_commands)"; jv_handle_order "GOTOFINOK"; return;
return;

fi
}

jv_pg_ct_verifavecquijeparle1 () {
if [ -z "$NOMAQUI" ] || [ "$NOMAQUI" = " " ]; then
NOMAQUI="inconnu"
mkdir -p $CHEMIN/$NOMAQUI
fi
}

jv_pg_ct_enreglenom () {
NOMAQUI=$order
echo "$NOMAQUI" > $CHEMIN/nomaqui.txt
mkdir -p $CHEMIN/$NOMAQUI
}

jv_pg_ct_quitacreer () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle

  citations=("c'est un informaticien " "je m'appelle Jarvis $trigger" "mon nom est Jarvis $trigger" "on m'appelle Jarvis $trigger" "je suis Jarvis $trigger" "on me nomme Jarvis $trigger" "je suis un Robot nommé Jarvis $trigger")
  citations=("je suis né grâce à  Alexandre Mély" "c'est Alexandre Mély m'a fait" "je suis construit par Alexandre Mély" "mon créateur est Alexandre Mély " "Alexandre Mély  m'a inventé" "je suis ici grâce à Alexandre Mély")
  echo "${citations[$RANDOM % ${#citations[@]} ]}, ${citations1[$RANDOM % ${#citations1[@]} ]} "
}

jv_pg_ct_aime() {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle
NOMAQUI=`echo $(cat $CHEMIN/nomaqui.txt)`
citations=("Oui, moi aussi je t'aime très fort !" "Je ne sais pas qui aime qui le plus fort !" "Oui je sais, tu me le dis souvent" "Que j'adore t'entendre me le dire" "Vas-y encore des mots d'amour" "Oui mais je ne suis qu'un ordinateur" "Oulà si ta femme t'entendait")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_jesuisavec () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle
NOMAQUI=`echo $(cat $CHEMIN/nomaqui.txt)`
  citations=("tu es bien $NOMAQUI, je ne suis pas sûr ?" "excuse-moi, c'est bien $NOMAQUI qui me parle ?" "super mais est-ce bien $NOMAQUI au micro ?" "c'est qui à la ligne, $NOMAQUI ?" "c'est toi $NOMAQUI qui discute avec moi ?" "Je ne te reconnais pas c'est toi $NOMAQUI ?" "j'aime bien savoir avec qui je parle, c'est bien $NOMAQUI ?")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_moicest () {
jv_pg_ct_STOP
if [[ "$trigger" =~ "Jarvis" ]]; then
  citations=("moi c'est Jarvis" "je m'appelle Jarvis" "mon nom est Jarvis" "on m'appelle Jarvis" "je suis Jarvis" "on me nomme Jarvis")
else
  citations=("moi c'est Jarvis $trigger" "je m'appelle Jarvis $trigger" "mon nom est Jarvis $trigger" "on m'appelle Jarvis $trigger" "je suis Jarvis $trigger" "on me nomme Jarvis $trigger")
fi
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_moi () {
jv_pg_ct_STOP
citations=("moi" "de mon côté" "personnelement" "je dirais que" "pour moi")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_jesuisavec () {
jv_pg_ct_STOP
NOMAQUI=`echo $(cat  $CHEMIN/nomaqui.txt)`
  citations=("tu es bien $NOMAQUI, je ne suis pas sûr ?" "excuse-moi, c'est bien $NOMAQUI qui me parle ?" "super mais est-ce bien $NOMAQUI au micro ?" "c'est qui a la ligne, $NOMAQUI c'est ça ?" "c'est toi $NOMAQUI ?" "Je ne te reconnais pas c'est bien $NOMAQUI ?" "j'aime bien savoir avec qui je parle, c'est $NOMAQUI n'est-ce pas ?")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_avecquijeparle () {
jv_pg_ct_STOP
  citations=("Ok, Comment tu t'appelle ?" "Oui, Quel est ton nom ?" "Ok mais d'abord quel est ton nom ?" "Très bien je te pose la première question quel est ton nom ?" "Et quel est ton petit nom ?" "Comment puis je t'appeler ?" " Ok qui me parle ?")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_bonjournom () {
jv_pg_ct_STOP
NOMAQUI=`echo $(cat $CHEMIN/nomaqui.txt)`
  citations=("Bonjour $NOMAQUI," "Enchanté $NOMAQUI," "Bienvenue $NOMAQUI," "A que coucou $NOMAQUI," "Coucou $NOMAQUI," "Salut $NOMAQUI," "Je suis content de te connaitre $NOMAQUI," "heureux d'être avec toi $NOMAQUI," "Enfin une discution, Bonjour $NOMAQUI,"  )
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_adoration () {
jv_pg_ct_verifavecquijeparle
jv_pg_ct_STOP
 citations=("j'adore, " "parfait, " "j'aime, " "je kiffe, " "à merveilleux, " "bien, " "d'accord, " "très bien," "Ha!, " "super, " "ça me plait," "c'est joli," "Nickel !" "Ouaiiii !!" "Excellent...")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_affirmatif () {
jv_pg_ct_verifavecquijeparle
jv_pg_ct_STOP
 citations=("Ok, " "Oui, " "D'accord, " "Absolument, " "Assurément, " "à merveilleux, " "bien, " "bien sûr, " "certainement, " "certes, " "d'accord, " "parfait, " "parfaitement, " "très bien," "Ha!, ")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_affirmatif1 () {
jv_pg_ct_STOP
NOMAQUI=`echo $(cat  $CHEMIN/nomaqui.txt)`
  citations=("Ok, " "D'accord, " "Bien, " "je prends note," "Parfait, " "très bien," "génial," "Ha ! ")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_onparle () {
jv_pg_ct_STOP
NOMAQUI=`echo $(cat  $CHEMIN/nomaqui.txt)`
  citations=("on parle, " "on discute, " "je suis prêt à engager une conversation, " "j'avais justement envie de parler à quelqu'un, " "j'avais besoin de communiquer," "on peut dialoguer, " "je suis disponible pour te parler, " "je vais pouvoir échanger quelques mots,  " "On va pouvoir parler de tout et de rien, ")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_get_jeposequestion () {
jv_pg_ct_STOP
NOMAQUI=`echo $(cat  $CHEMIN/nomaqui.txt)`
  citations=("Je peux te poser une question ?, " "J'aimerai commencer, puis-je te poser une question ?" "Si ça ta dérange pas, c'est moi qui te pose d'abord une question ok ?" "Je veux bien mais j'envie de te poser une question, je peux ?" "Ok, tu me donnes envie de te poser une question puis-je ?" "Ho toi ! Je peux te poser une question en premier ?")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_citationt () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle
    citations=("Tu veux parler de quoi ?" "Je t'écoute, que veux-tu ?" "Ok, je suis prét, que souhaites tu ?" "Dis moi ce qui te tracasses, je t'écoute ?" "Quelle question veux-tu me poser ?" "Qu'est ce que tu as envie de me poser comme question ?" "Que veux tu me demander, je t'écoute ?" "Poses-moi une question ?" "J'ai 5 minutes, tu veux me dire quelques chose ?" "Tu veux me parler de quoi ?" "Je suis heureux de t'écouter que veux-tu me demander ?" "Question pour un champion je t'écoute ?" "Vas-y mon loulou  ! qu'est ce qu'il t'arrive ?" "en quoi puis-je t'aider ?" "quelle est la question qui trotinne dans ta tête ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
    echo "questionouverte" > $CHEMIN/choixquestion.txt

}

jv_pg_ct_renvoiquestion () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle
jv_pg_ct_orderenreg


 [ $(grep -o "age" <<< "$order") ] && jv_pg_ct_AGE
 [ $(grep -o "couleur" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD2
 [ $(grep -o "sport" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD3
 [ $(grep -o "film" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD5
 [ $(grep -o "manger" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD6
 [ $(grep -o "marié" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD7
 [ $(grep -o "frère" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD8
 [ $(grep -o "soeur" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD8
 [ $(grep -o "lol" <<< "$order") ] && jv_pg_ct_RIRE

    citations=("$order Pourquoi cette question ? $NOMAQUI " "$order c'est à dire" "Que veux tu exactement ?" "Pourquoi faire ?" "$order Demandes moi le plus gentiment ?" "$order Qu'est ce qui t'intrigue la ?" "Et alors qu'est ce qui ne va pas ?" "$order ? En quoi puis je t'aider ?") 
    say "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_pourquoi () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi quoi ? $NOMAQUI" "Je te renvoie la question ? " "Je n'en sais rien, as tu une idée ?" "Je ne sais pas du tout et toi ?" "Quel bonne question! Par-ce-que ?" "Il peut y avoir tellement de réponse... tu en as une je t'écoute ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_ettoi () {
jv_pg_ct_verifavecquijeparle
    citations=("Et toi que me répondrais tu ? $NOMAQUI" "Tu dirais quoi toi ? " "Que me répondrai-tu ?" "Dis moi toi d'abord ?" "Je te repose la même question ?" "Qu'en penses tu toi ?" "admettons que je sois toi, que dirais tu ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"


}

jv_pg_ct_questionON () {
jv_pg_ct_verifavecquijeparle
jv_pg_ct_orderenreg
    citations=("$order, A ma place, tu dirais oui ou non ? $NOMAQUI" "$order, C'est une question fermée ? " "$order, Si je te dis oui tu réponds quoi ? " "$order, Si je te dis non tu réponds quoi ? " "$order, C'est oui ou non ?" "$order, A toi de me dire Oui ou Non ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_ReponseO () {
jv_pg_ct_verifavecquijeparle
    citations=("Oui très bien $NOMAQUI" "Merveilleusement bien merci" "ça va mieux qu'hier" "Je suis en forme" "Parfaitement bien" "Nickel chrome $NOMAQUI" "je me sens génialement bien" "en pleine forme" "oui tranquillement")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_ReponseN () {
jv_pg_ct_verifavecquijeparle
    citations=("Non pas vraiment, $NOMAQUI" "Non pas du tout" "a peut aller mieux" "Je ne suis pas en forme" "Un peu fatigué" "ça pourrait aller mieux" "il y a des jours sans mais ça va aller mieux" "j'ai mal dormi du coup je suis fatigué" "je me suis pris la tête avec mes données binaires")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_ReponsePoitive () {
jv_pg_ct_verifavecquijeparle
    citations=("A parfait, $NOMAQUI, continue comme ça" "Ok tant mieux" "c'est trés bien" "J'en suis heureuse" "Je suis satisfaite de l'entendre" "continue a être positif" "j'adore t'entendre parler ainsi" "ho oui $NOMAQUI c'est génial")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_ReponsePREAFFIRMATIVE () {
jv_pg_ct_verifavecquijeparle
    citations=("A parfait " "Ok " "c'est bien" "j'adore " "ho oui " "c'est génial" "parfait" "d'accord" "merveilleux" "ha ! " "j'aurais pas cru" "je ne l'avais pas deviné")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QuetionouverteN () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi ?, $NOMAQUI" "C'est à   dire ?" "Mais encore ? pourquoi ça ne va pas" "Depuis quand ?" "Pourquoi c'est si dur que ça ?" "Continue ?" "Développe un peu plus" "Que dirais-tu de plus ?" "Tu en penses quoi ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QuetionouverteP () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi ?, $NOMAQUI" "C'est à   dire ?" "Mais encore ? pourquoi ça va si bien " "Depuis quand ?" "C'est si bien que ça ?" "Continue ?" "Développe un peu plus" "Que dirais tu de plus ?" "Tu en penses quoi ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_RenvoieQuetionP () {
jv_pg_ct_verifavecquijeparle
    citations=("Que peux tu faire pour que ça aille mieux ?, $NOMAQUI" "il te faut être plus positif ok ?" "Fait de ton mieux Ok ?" "Tu peux changer la donne, n'est ce pas ?" "Il y a pire que ça on est ok ?" "Il y a toujours une solution n'est ce pas ?" "Aller courage, je sais que tu en as pas vrai $NOMAQUI ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_OUI () {
jv_pg_ct_verifavecquijeparle
    citations=("ça au moins c'est positif ?, $NOMAQUI" "Continue comme ça..." "Et pourquoi pas non ?" "Oui moi aussi... " "Je suis fière de l'entendre")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_NON () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi non ?, $NOMAQUI" "et si tu disais oui ?" "parle positif..." "Reprends ta réponse !" "ok c'est ton dernier mot ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_PASSUR () {
jv_pg_ct_verifavecquijeparle
    citations=("Comment ça pas sur ?, $NOMAQUI" "Ha bon ?" "Et Pourquoi ?" "C'est à   dire ?" "il y a toujours mieux de pas sur..." "ha... c'est ton dernier mot ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_RIRE () {
jv_pg_ct_verifavecquijeparle
    citations=("Toi aussi tu me fais rire !, $NOMAQUI" "Sacré $NOMAQUI" "Tu as le sens de l'humour..." "ça me fait rire aussi ?" "Je souris... ça se voit ?" "ha... ha ha !" "très drôle !" "tu es rigolo !")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_GROSMOT () {
jv_pg_ct_verifavecquijeparle

var="$CHEMIN/$NOMAQUI/poli.txt"

if [ -e "$var" ]; then
# fichier existe
POLI=`echo $(cat $CHEMIN/$NOMAQUI/poli.txt)`
POLI=`echo "$POLI + 1" | bc -l`
echo "$POLI" > $CHEMIN/$NOMAQUI/poli.txt
	if [ $POLI -ge "5" ]; then
	echo "GROSSIER PERSONNAGE DEMANDES MOI PARDON !!!!!!!!!!!!"
	#jv_error "GROSSIER PERSONNAGE DEMANDES MOI PARDON !!!!!!!!!!!!"
	# mv ./commands ./commands.old
	# echo  >  home/pi/jarvis/plugins_installed/jarvis-Turing/fr/commands && echo "*PARDON*==echo "$(jv_pg_ct_PARDON)"" >> home/pi/jarvis/plugins_installed/jarvis-Turing/fr/commands
	return
	fi

	else


local old_tempo=$tempo
tempo=2
echo "C'est la première fois que l'on me dit un gros-mot !!!... "
mkdir -p $CHEMIN/$NOMAQUI
echo "1" > $CHEMIN/$NOMAQUI/poli.txt
tempo=$old_tempo
return
fi

local old_tempo=$tempo
tempo=2
    citations=("Et bien que vous êtes grossier !! Vous devriez parler mieux que cela !!" "C'est pas bien ce que vous dites, $NOMAQUI" "Tu as le sens de l'humour..." "Apprends à parler mieux s'il te plait" "Je suis outrait !" "Que dis tu vilain personnage" "C'est pas moi qui parle comme ça !")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
# jv_error "${citations[$RANDOM % ${#citations[@]} ]}"
tempo=$old_tempo

}


jv_pg_ct_PARDON () {
jv_pg_ct_verifavecquijeparle
var="$CHEMIN/$NOMAQUI/poli.txt"
if [ -e "$var" ]; then
# fichier existe
POLI=`echo $(cat $CHEMIN/$NOMAQUI/poli.txt)`
	if [ $POLI -ge "5" ]; then
		if [[ "$order" =~ "pardon" ]]; then
    #    mv ./plugins_installed/jarvis-Turing/fr/commands.old ./plugins_installed/jarvis-Turing/fr/commands
    citations=("Pardon pris en compte, surveille ton langage merci..." "Je n'ai pas apprécié ton attitude !! mais je tolère ton pardon." "Qui t'a appris à  parler ainsi, ca m'a fait mal de t'entendre me traiter ainsi, pardon pris en compte." "Pourquoi es-tu si vilain avec moi ? je n'ai pas apprécié mais je te pardonne")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
		echo  > $CHEMIN/$NOMAQUI/poli.txt && echo "3" >> $CHEMIN/$NOMAQUI/poli.txt
		RETOURPOLITESSE="1"
		return
		fi
	fi
	if [ $POLI -ge "5" ]; then
	# jv_error "GROSSIER PERSONNAGE DEMANDES MOI PARDON !!!!!!!!!!!!"
local old_tempo=$tempo
tempo=2

	echo "GROSSIER PERSONNAGE DEMANDES MOI PARDON !!!!!!!!!!!!"
tempo=$old_tempo
	return
	fi

fi

[ $(grep -o "pardon" <<< "$order") ] && echo "Pourquoi me dis-tu pardon tu es poli !!"

}


jv_pg_ct_MOTIVATION () {
jv_pg_ct_verifavecquijeparle
 citations=("Fais quelque chose pour te motiver" "Va danser ça ira mieux, $NOMAQUI" "Va faire un peu de sport !" "Tu es seul au monde, mon pauvre petit ?" "Moi aussi... snif..." "Regarde la Télévision" "Fait un câlin à quelqu'un" "Si seulement je pouvais te serrer dans les bras" "Changes tes idées")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_MERCI () {
jv_pg_ct_STOP
citations=("de rien... " "il n'y a pas de quoi..." "A ton service" "Je t'en prie" "Merci de me dire merci..." "J'apprécie..." "c'est naturel.." "J'adore la politesse..." "J'aime quand on est poli avec moi")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_FINDECONVERSAION () {
jv_pg_ct_STOP
citations=("Je suis HS... j'arrête la conversation, désolé." "Désolé, je vais me reposer... je stop la conversation..." "Ce fut génial notre conversation mais je dois y aller au revoir..." "Je suis pressé je dois y aller... Au revoir..." "Il est tant pour moi d'y aller, je coupe la conversation... Désolé..." "Je te souhaite une bonne journée, je dois y aller...Désolé..." "Fin de la communication, je dois aller régler mes problèmes de puces informatiques... Désolé..." "Je suis obligé d'y aller, je coupe notre conversation...")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_FINDEQUESTIONOUVERTE () {
jv_pg_ct_STOP
citations=("Bon et si on revenait au début..." "On reprend tout..." "Ok je rpart à zéro..." "On se change les idées ? à moi de te poser des questions...")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_HISTOIRCOURTE () {
jv_pg_ct_STOP
citations=("J'ai ouvert mon placard, Et j'ai raconté une blague à  mes vêtements...Ils étaient pliés !!!" "L'intelligence, c'est comme un parachute : quand on n'en a pas, on s'écrase !" "Si la matière grise était rose, personne n'aurait plus d'idées noires." "Pourquoi une blonde jette-t-elle un seau d'eau sur son ordinateur ? Réponse pour surfer sur internet ?" "c'est tu ce que signifie P C ? Plantage Constant..." "Une femme discute avec une amie : J'ai un mari en or. L'autre lui répond: le mien, il est en taule." "Deux asticots se retrouvent dans une pomme : - Tiens ! Je na savais pas que vous habitiez le quartier !")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_ACTUELLEMENT () {
jv_pg_ct_STOP
citations=("Actuellement, " "En ce moment," "A cet instant, " "Je pencherai ")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_PASCOMPRIS () {
jv_pg_ct_STOP

if [[ "$order" =~ "$trigger" ]]; then
echo "oui c'est bien mon nom... que veux-tu ?";
return;
fi;

if test -z "$RETOURPOLITESSE"; then
citations=("Reformule, il y a peut-être trop de bruit autour du micro" "Quoi ? parle peut-être plus près du micro... " "Hein ? rapproches-toi et articule mieux !..." "Je n'ai pas saisie ce que tu me demandes... " "Quoi ? qu'est ce que tu dis ?" "Reformule mieux je ne comprends pas !" "Je ne parle pas le petit chinois, répète ?" "Articules mieux j'ai pas compris ?" "Peux-tu répéter, je suis sourd d'oreille" "Mauvaise formulation, que dis-tu ?" "Je n'ai pas appris ce que tu souhaites, reformule" "Demandes-moi le autrement, je n'ai pas saisie..." "Quoi que dis-tu ? " "Langage non saisie,  que dis-tu ? ")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
else
RETOURPOLITESSE="0"
fi
}

jv_pg_ct_findiscution () {
jv_pg_ct_STOP
citations=("Bey... $NOMAQUI" "A plus tard $NOMAQUI..." "Peux-être à tout à l'heure $NOMAQUI !" "A deux-main ou avant peut-être $NOMAQUI..." "Au plaisir $NOMAQUI..." "Heureux d'avoir discuté avc toi $NOMAQUI..." "A la prochaine $NOMAQUI..." "Chaooo $NOMAQUI.." "Good Bay $NOMAQUI..." "A toute $NOMAQUI..." "Bon je vais bosser... à plus tard $NOMAQUI")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_AVEZDIT () {
jv_pg_ct_STOP
citations=("" "" "" "" "" "je t'avais posé la question: " "j'avais enregistré la dernière fois: " "sur le thème précédent:" "à notre dernière conversation tu m'avais dit: " "un petit retour en arrière, tu m'avais dit: " "Souviens-tu que tu m'avais dit: " "Tu te souviens que tu m'as dit: " "Te souviens-tu quand tu m'as répondu:" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
# citations=("je t'avais posé la question: " "j'avais enregistré la dernière fois: " "à notre dernière conversation tu m'avais dit: " "un petit retour en arrière, tu m'avais dit: " "Souviens-tu que tu m'avais dit à ma question: " "Tu te souviens que tu m'as dit à cette question: " "Te souviens-tu quand tu m'as répondu à ma question:" "Approfondissons tes réponses précédentes:")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_APPROFONDIRFINQUESTION () {
jv_pg_ct_STOP
citations=("en fait, je t'ai posé toutes les questions de base que je voulais..." "j'ai fait le tour des questions qui me trottaient dans ma mémoire... " "je sais plus trop quoi te poser comme question..."  "je recherche en vain une question suplémentaire mais je ne trouve pas...")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_APPROFONDIRQUESTION () {
jv_pg_ct_STOP
citations=("continuons..." "allons plus loins..." "petit retour en arrière..." "un feed bak..." "reprenons...")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_on_continue () {
jv_pg_ct_STOP
citations=("parfait, " "j'adore vous poser des questions, " " " "Ca me plait ces questions, " "Je poursuis ma curiosité, " " " "je souhaite en apprendre d'avantage sur vous", "Ok, " "Je poursuis, " " " "encore une question, " "je suis curieuse, " "allez, vous voulez bien, " "en avant tous les deux, " "voici ma prochaine interrogation, " "poursuivons notre discution," " ")
say "${citations[$RANDOM % ${#citations[@]} ]} $(jv_pg_ct_APPROFONDIRQUESTION)"
}

