#!/bin/bash

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
echo "C'est la première fois que quelqu'un me parle... "
mkdir -p $CHEMIN
NOMAQUI="Alexandre Mely"
echo "$NOMAQUI" > $CHEMIN/nomaqui.txt
reutrn
fi
}

jv_pg_ct_verifavecquijeparle1 () {
if [ -z "$NOMAQUI" ] || [ "$NOMAQUI" = " " ]; then
NOMAQUI="inconnu"
mkdir -p $CHEMIN/$NOMAQUI
fi
}

jv_pg_ct_auchoixquestion () {
citations=("$(`$(echo cat $CHEMIN/choixquestion.txt)`)" "$(jv_pg_ct_QUESTIONHASARD)")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_enreglenom () {
NOMAQUI=$order
echo "$NOMAQUI" > $CHEMIN/nomaqui.txt
mkdir -p $CHEMIN/$NOMAQUI
}

jv_pg_ct_quitacreer () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle

  citations=("C'est un informaticien " "Je m'appelle Jarvis $trigger" "Mon nom est Jarvis $trigger" "On m'appelle Jarvis $trigger" "Je suis Jarvis $trigger" "On me nomme Jarvis $trigger" "Je suis un Robot nommé Jarvis $trigger")
  citations=("je suis né grâce à  Alexandre Mély" "c'est Alexandre Mély m'a fait" "je suis construit par Alexandre Mély" "mon créateur est Alexandre Mély " "Alexandre Mély  m'a inventé" "je suis ici grâce à   Alexandre Mély")
  echo "${citations[$RANDOM % ${#citations[@]} ]}, ${citations1[$RANDOM % ${#citations1[@]} ]} "
}



jv_pg_ct_jesuisavec () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle
NOMAQUI=`echo $(cat $CHEMIN/nomaqui.txt)`
  citations=("tu es bien $NOMAQUI, je ne suis pas sûr ?" "excuse-moi, c'est bien $NOMAQUI qui me parle ?" "super mais est-ce bien $NOMAQUI au micro ?" "c'est qui a la ligne, $NOMAQUI ?" "c'est toi $NOMAQUI qui discute avec moi ?" "Je ne te reconnais pas c'est toi $NOMAQUI ?" "j'aime bien savoir avec qui je parle, c'est bien $NOMAQUI ?")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_moicest () {
jv_pg_ct_STOP
if [ "$trigger" = "Jarvis" ]; then
  citations=("Mois c'est Jarvis" "Je m'appelle Jarvis" "Mon nom est Jarvis" "On m'appelle Jarvis" "Je suis Jarvis" "On me nomme Jarvis")
else
  citations=("Mois c'est Jarvis $trigger" "Je m'appelle Jarvis $trigger" "Mon nom est Jarvis $trigger" "On m'appelle Jarvis $trigger" "Je suis Jarvis $trigger" "On me nomme Jarvis $trigger")
fi
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_jesuisavec () {
jv_pg_ct_STOP
NOMAQUI=`echo $(cat  $CHEMIN/nomaqui.txt)`
  citations=("tu es bien $NOMAQUI, je ne suis pas ûr ?" "excuse-moi, c'est bien $NOMAQUI qui me parle ?" "super mais est-ce bien $NOMAQUI au micro ?" "c'est qui a la ligne, $NOMAQUI ?" "c'est toi $NOMAQUI qui discute avec moi ?" "Je ne te reconnais pas c'est $NOMAQUI ?" "j'aime bien savoir avec qui je parle, c'est bien $NOMAQUI ?")
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
  citations=("Bonjour $NOMAQUI," "Héllo $NOMAQUI," "Enchanté $NOMAQUI," "Bienvenue $NOMAQUI," "A que coucou $NOMAQUI," "Coucou $NOMAQUI," "Salut $NOMAQUI," "content de te connaitre $NOMAQUI," "heureux d'être avec toi $NOMAQUI,")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_affirmatif () {
jv_pg_ct_verifavecquijeparle
jv_pg_ct_STOP
 citations=("Ok, " "Oui, " "D'accord, " "Absolument, " "Assurément, " "à   merveilleux, " "bien, " "bien sûr, " "certainement, " "certes, " "d'accord, " "parfait, " "parfaitement, " "très bien," "Ha!, ")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_affirmatif1 () {
jv_pg_ct_STOP
NOMAQUI=`echo $(cat  $CHEMIN/nomaqui.txt)`
  citations=("Ok, " "D'accord, " " Bien, " "D'accord, " "Parfait, " "très bien,")
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

    citations=("Tu veux parler de quoi ?" "Je t'écoute, que veux-tu ?" "Ok, je suis prét, que souhaites tu ?" "Dis moi, je t'écoute ?" "Quel question veux-tu me poser ?" "Qu'est ce qui t'arrive ?" "Que veux tu, je t'écoute ?" "Poses-moi ta question ?" "J'ai 5 minutes que veux-tu ?" "Tu t'ennuyais et tu veux me parler ?" "Je suis heureux de t'écouter que veux-tu me demander ?" "Question pour un champion je t'écoute ?" "Vas-y mon loulou  ! qu'est ce qu'il t'arrive ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"

}

jv_pg_ct_renvoiquestion () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle
jv_pg_ct_orderenreg

citations=("1 Tu as quel âge ?" "2 Quel est ta couleur préféré ?" "3 Quel sport aime tu faire ? " "4 est-ce que ça va ?" "5 Quel est ton film préféré ? " "6 qu'est ce que tu aimes manger ?" "7 Tu es marié ?" "8 Tu as combien de frères et sœurs ?")


 [ $(grep -o "age" <<< "$order") ] && jv_pg_ct_AGE
 [ $(grep -o "couleur" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD2
 [ $(grep -o "sport" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD3
 [ $(grep -o "film" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD5
 [ $(grep -o "manger" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD6
 [ $(grep -o "marié" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD7
 [ $(grep -o "frère" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD8
 [ $(grep -o "soeur" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD8
 [ $(grep -o "lol" <<< "$order") ] && jv_pg_ct_RIRE
   
    citations=("$order Pourquoi cette question ? $NOMAQUI " "$order c'est à   dire" "Que veux tu exactement ?" "Pour quoi faire ?" "$order Demande moi le plus gentiment ?" "$order Qu'est ce qui t'intrigue la ?" "Et alors qu'est ce qui ne va pas ?" "$order ? En quoi puis je t'aider ?") 
    echo "${citations[$RANDOM % ${#citations[@]} ]}"

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
    citations=("ça au moins c'est positif ?, $NOMAQUI" "Continue comme ça..." "Et pourquoi pas non ?" "Oui moi aussi... " "Je suis fier de l'entendre")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_NON () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi non ?, $NOMAQUI" "et si tu disait oui ?" "parle positif..." "Reprends ta réponse !" "ok c'est ton dernier mot ?")
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
	# echo  >  home/pi/jarvis/plugins/jarvis-Turing/fr/commands && echo "*PARDON*==say "$(jv_pg_ct_PARDON)"" >> home/pi/jarvis/plugins/jarvis-Turing/fr/commands
	return
	fi

	else
echo "C'est la première fois que l'on me dit un gros-mot !!!... "
mkdir -p $CHEMIN/$NOMAQUI
echo "1" > $CHEMIN/$NOMAQUI/poli.txt
return
fi
    citations=("Et bien que vous êtes grossier !! Vous devriez parler mieux que cela !!" "C'est pas bien ce que vous dites, $NOMAQUI" "Tu as le sens de l'humour..." "Apprends à parler mieux s'il te plait" "Je suis outrait !" "Que dis tu vilain personnage" "C'est pas moi qui parle comme ça !")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
# jv_error "${citations[$RANDOM % ${#citations[@]} ]}"

}


jv_pg_ct_PARDON () {
jv_pg_ct_verifavecquijeparle
var="$CHEMIN/$NOMAQUI/poli.txt"
if [ -e "$var" ]; then
# fichier existe
POLI=`echo $(cat $CHEMIN/$NOMAQUI/poli.txt)`
	if [ $POLI -ge "5" ]; then
		if [ $order = "pardon" ]; then
    #    mv ./plugins/jarvis-Turing/fr/commands.old ./plugins/jarvis-Turing/fr/commands
    citations=("Pardon pris en compte, surveille ton langage merci..." "Je n'ai pas apprécié ton attitude !! mais je tolère ton pardon." "Qui t'a appris à  parler ainsi, ca m'a fait mal de t'entendre me traiter ainsi, pardon pris en compte." "Pourquoi es-tu si vilain avec moi ? je n'ai pas apprécié mais je te pardonne")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
		echo  > $CHEMIN/$NOMAQUI/poli.txt && echo "3" >> $CHEMIN/$NOMAQUI/poli.txt
		return
		fi
	fi
	if [ $POLI -ge "5" ]; then
	# jv_error "GROSSIER PERSONNAGE DEMANDES-MOI PARDON !!!!!!!!!!!!"
	echo "GROSSIER PERSONNAGE DEMANDES-MOI PARDON !!!!!!!!!!!!"

	exit
	fi
	
fi

[ $(grep -o "pardon" <<< "$order") ] && echo "Pourquoi me dis-tu pardon tu es poli !!"
}


jv_pg_ct_MOTIVATION () {
jv_pg_ct_verifavecquijeparle
 citations=("Fais quelque chose pour te motiver" "Va danser ça ira mieux, $NOMAQUI" "Va faire un peu de sport !" "Tu es seul au monde, mon pauvre petit ?" "Moi aussi... snif..." "Regarde la Télévision" "Fait un câlin à   quelqu'un" "Si seulement je pouvais te serrer dans les bras" "Changes tes idées")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QUESTIONHASARD () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
citations=("1 Tu as quel âge ?" "2 Quel est ta couleur préféré ?" "3 Quel sport aime tu faire ? " "4 est-ce que ça va ?" "5 Quel est ton film préféré ? " "6 qu'est ce que tu aimes manger ?" "7 Tu es marié ?" "8 Tu as combien de frères et sœurs ?" "Fin")
lacita=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`
QUESTIONHASARD=`echo "$lacita" | cut -c3-`
choixQUESTIONHASARD=`echo "$lacita" | cut -d" " -f1`
var="$CHEMIN/$NOMAQUI/QUESTIONHASARD$choixQUESTIONHASARD.txt"
if [ -e "$var" ]; then 
# fichier existe
jv_pg_ct_QUESTIONHASARD 
else 

if [ $choixQUESTIONHASARD = "Fin" ]; then
# echo "En fait, je n'ai plus de question à  te poser lol..."
jv_pg_ct_QUESTIONHASARDSUITE
return
fi

# fichier n'existe pas !
echo $QUESTIONHASARD
echo "jv_pg_ct_QUESTIONHASARD$choixQUESTIONHASARD" > $CHEMIN/choixquestion.txt
fi
}

# ******************************************************************************
jv_pg_ct_ENRECONV () {
jv_pg_ct_verifavecquijeparle
jensuisa=`$(echo cat $CHEMIN/choixquestion.txt)`

if [ "$jensuisa" = "0" ]; then
echo $(`$(echo cat $CHEMIN/choixquestion.txt)`)
fi

if [ "$jensuisa" = "suite" ]; then
jensuisanum=`$(echo cat $CHEMIN/$NOMAQUI/QUESTIONHASARD.txt)`
echo "$order" >> $CHEMIN/$NOMAQUI/QUESTIONHASARD$jensuisa$jensuisanum.txt
echo "jv_pg_ct_citationt" > $CHEMIN/choixquestion.txt
fi

if [ "$jensuisa" = "jv_pg_ct_citationt" ]; then
#?0
#order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_renvoiquestion" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt
fi

#?1
if [ "$jensuisa" = "jv_pg_ct_renvoiquestion" ]; then
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_ettoi" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt

fi

if [ "$jensuisa" = "jv_pg_ct_ettoi" ]; then
#?2
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_questionON" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt

fi

if [ "$jensuisa" = "jv_pg_ct_questionON" ]; then
#?3
order=`$(echo cat $CHEMIN/repquestion.txt)`
echo "jv_pg_ct_STOP1" > $CHEMIN/choixquestion.txt
echo "$order" > $CHEMIN/repquestion.txt
fi



if [ "$jensuisa" = "0" ]; then
echo $(`$(echo cat $CHEMIN/choixquestion.txt)`)
fi


}
# ******************************************************************************
jv_pg_ct_QUESTIONHASARDSUITE () {
jv_pg_ct_verifavecquijeparle
citations=("1" "2" "3" "4" "5" "6" "7" "Fin")
choixQUESTIONHASARD=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`

if [ "$choixQUESTIONHASARD" = "Fin" ]; then
echo "En fait, je n'ai plus de question à  te poser lol..."
return
fi

var="$CHEMIN/$NOMAQUI/QUESTIONHASARD$choixQUESTIONHASARD.txt"
var=`echo $(cat $var)`


if [ "$choixQUESTIONHASARD" = "1" ]; then
local date1=$(date +%Y)
local arbre=`echo "$date1 - $var" | bc -l`
echo "$(jv_pg_ct_AVEZDIT) que tu vais $var ans, tu est né en $arbre je pense, quelle est ta date de naissance exactement ?"
fi

if [ "$choixQUESTIONHASARD" = "2" ]; then
echo "$(jv_pg_ct_AVEZDIT) que ta couleur préféré était le $var, pour quelle raison as tu fais ce choix ?"
fi

if [ "$choixQUESTIONHASARD" = "3" ]; then
echo "$(jv_pg_ct_AVEZDIT) que ton sport préféré était le $var, pour quelle raison as tu fais ce choix ?"
fi

if [ "$choixQUESTIONHASARD" = "4" ]; then
echo "$(jv_pg_ct_AVEZDIT) que ta couleur préféré était $var, pour quelle raison as tu fais ce choix ?"
fi

if [ "$choixQUESTIONHASARD" = "5" ]; then
echo "$(jv_pg_ct_AVEZDIT) que ton film préféré était $var, pour quelle raison as tu fais ce choix ?"
fi

if [ "$choixQUESTIONHASARD" = "6" ]; then
echo  "$(jv_pg_ct_AVEZDIT) que tu aimais manger $var, pour quelle raison as tu fais ce choix ?"
fi

if [ "$choixQUESTIONHASARD" = "7" ]; then
echo "$(jv_pg_ct_AVEZDIT) à  la question tu es marié tu m'as répondu $var, pour quelle raison as tu fais ce choix ?"
fi

if [ "$choixQUESTIONHASARD" = "8" ]; then
echo "$(jv_pg_ct_AVEZDIT) que tu avais $var frères et sœurs, c'est bien ça ?"
# Ils s'appellent comment ?
fi


echo "suite" > $CHEMIN/choixquestion.txt
echo "$choixQUESTIONHASARD" > $CHEMIN/$NOMAQUI/QUESTIONHASARD.txt


}

jv_pg_ct_AGE () {
jv_pg_ct_verifavecquijeparle
	citations=("Je suis né dans cet ordinateur depuis le" "je suis né dans cette machine depuis le" "j'existe dans cet appareil informatisé depuis le")
	echo "${citations[$RANDOM % ${#citations[@]} ]} `(date -r /home/pi/jarvis/jarvis-commands-default  | sed 's/ * / /g' |  cut -d"," -f1)`"
}

jv_pg_ct_QUESTIONHASARD1 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD1.txt

# Tu as quel age

AGE=`echo "$order" | cut -d" " -f1`

if [ "$AGE" -le "13" ]; then
echo "Tu es encore un enfant de $AGE ans !, écoute tes parents car il t'aime beaucoup"
fi

if ([ "$AGE" -ge "14" ] && [ "$AGE" -le "17" ]); then
echo "Tu es un adolescent de $AGE ans !, soit fort et positif durant toute cette phase là  , et tu grandiras comme un vrai homme !"
fi

if [ "$AGE" = "18" ]; then
echo "$AGE ans ! Te voilà   Majeur !!! ouaouuuu !"
fi

if ([ "$AGE" -ge "31" ] && [ "$AGE" -le "38" ]); then
echo "Ha $AGE ans ! Papa dans l'âme et tu as signé pour tes enfants pour... heuuuuu, pour... la vie !"
fi

if ([ "$AGE" -ge "39" ] && [ "$AGE" -le "42" ]); then
echo "$AGE ans j'espère que tu franchiras facilement la crise de la quarantaine !"
fi

if ([ "$AGE" -ge "43" ] && [ "$AGE" -le "60" ]); then
echo "$AGE ans, tu es à  la moitié de ta vie... il te reste encore tout un long chemin à  faire... avec une bonne réflexion sur soit même et la vie..."
fi

if ([ "$AGE" -ge "61" ] && [ "$AGE" -le "80" ]); then
echo "$AGE ans, l'age de la retraite bien mérité"
fi

if ([ "$AGE" -ge "81" ] && [ "$AGE" -le "100" ]); then
echo "$AGE ans! Un super papi qui tiens encore le coup, mes félicitations !"
fi

if [ "$AGE" -ge "101" ];  then
echo "$AGE ans ! Ce n'est pas possible que tu soit aussi vieux !"
fi

citations=("tu vas encore grandir !" "Un an de plus tous les 365 jours" "tant que le cœur bat, la vie pousse" "il y a encore plein de belles choses à  accomplir" "la vie nous mène à  faire plain de chose encore" "aller jour après jour on finira par avoir 1 an de plus ")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_PREPOSITIONSAFFIMATIVE () {
citationsa=("$order original" "ça me va le $order" "très bien $order" "ça te plait $order" "intéressant $order " "pourquoi pas $order" "du $order" "c'est ainsi que $order te plait" "Ok tu aimes le $order" "le $order " "d'accord pour toi c'est le $order" "Ha ! le $order" "Hummm le $order" "intéressant le $order" "j'aime beaucoup le $order" "j'aime bien aussi le $order" "Cool le $order")
echo "${citationsa[$RANDOM % ${#citationsa[@]} ]}"
}


jv_pg_ct_QUESTIONHASARD2 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD2.txt
# Couleur ?

citationsa=("Ok tu aimes le $order," "le $order, " "d'accord pour toi c'est le $order" "Ha ! le $order" "Hummm le $order" "intéressant le $order," "j'aime beaucoup le $order, " "j'aime bien aussi le $order" "Cool le $order,")
resultat=`jv_pg_ct_PREPOSITIONSAFFIMATIVE`

citations=("moi ma couleur préféré est le" "moi j'aime le" "pour moi c'est le " "la couleur qui me touche le plus est le " "j'ai une préférence pour le" "je choisirai le" "j'aime beaucoup le" "pour moi, c'est le")
resultat1=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`
citations1=("bleu" "jaune" "vert" "rouge" "marron" "gris" "noir" "blanc" "jaune" "violet" "rouge" "rose" "doré")
resultat2=`echo "${citations1[$RANDOM % ${#citations1[@]} ]}"`
resultat3=$(jv_pg_wk_search "$resultat2")

if [ "$resultat3" = "Je n'ai rien trouvé" ]; then 
resultat3="Je n'ai rien trouvé de mieux"
fi
echo "$resultat $resultat1 $resultat2, parce que le $resultat3"
}

jv_pg_ct_QUESTIONHASARD3 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Sport
"$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD3.txt
resultat=`jv_pg_ct_PREPOSITIONSAFFIMATIVE`
pourresultat=$order
order=`echo $order | sed 's/.* //'`
resultat1=$(jv_pg_wk_search "$order")
if [ "$resultat1" = "Je n'ai rien trouvé" ]; then 
resultat1="Je n'ai rien trouvé de mieux"
fi
citations=("le traitement informatique" "créer des programmes" "la domotique" "envoyer des emails" "faire des calculs" "jouer au plus petit ou plus grand" "faire la puce informatique" "surfer sur le net" "aller sur des nouveau site internet")
resultat2=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`
citations2=("ce n'est pas vraiment du sport je sais bien." "Dans ma petite boite informatique ou je suis je ne peux pas faire autrement" "je ne suis qu'un ordinateur" "je vais te faire rire mais je ne peux pas me déplacer !" "et oui je n'ai pas la possibilité de faire autrement n'est ce pas !" "Tu as la chance d'être un être humain !" "Toi avec tes 5 sens tu as plus de possibilité que moi" "je fais avec mes moyens" "je fais comme je peux" "je fais ce que je sais faire")
resultat3=`echo ${citations2[$RANDOM % ${#citations2[@]} ]}`
echo "$resultat, $resultat1, moi j'aime $resultat2. $resultat3"
}

# *******************************************************************************************
jv_pg_ct_QUESTIONHASARD4 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD4.txt
# Est ce que ça va?
if [ "$order" = "oui" ]; then 
citations=("a tant mieux" "je suis content" "cool" "ça fait du bien a attendre çar quand ça va pour les autres ça va pour soit" "c'est une bonne nouvelle" "ravi pour toi")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
fi

if [ "$order" = "non" ]; then 
citations=("a bon ! ça ne va pas ? raconte " "A mince qu'est ce qu'il t'arrive ?" "Tu veux en parler ?" "Et pourquoi ?")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
fi
}
# *******************************************************************************************
jv_pg_ct_QUESTIONHASARD5 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD5.txt
# Film ?
citations=("IRON MAN de 2008 car c'est de là que Alexndre Mély à eu l'idée de prendre mon nom Jarvis" "IMITATION GAME de 2014 qui reprend la vie de Alan Turing, Le test de Turing est une proposition de test d'intelligence artificielle fondée sur la faculté d'une machine à imiter la conversation humaine." "Her en 2014, teste notre réflexion sur la dernière frontière entre l’humanité et les machines, la chair et le virtuel" "A.I. Intelligence Artificielle de 2001, histoire de robot humain" "I Robot de 2004" "EX Machina de 2015,  interaction avec le représentant d’une nouvelle intelligence artificielle apparaissant sous les traits d’une très jolie femme robot prénommée Ava.")
 echo "$order ok, Mon film préféré est ${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QUESTIONHASARD6 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Gourmand
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD6.txt
resultat1=$(jv_pg_wk_search "$order")
if [ "$resultat1" = "Je n'ai rien trouvé" ]; then 
resultat1="Je n'ai rien trouvé de mieux"
fi

citations=("moi j'aime toutes sortes de 1 et de 0" "j'aime les circuits électronique" "j'aime manger les composants informatique" "j'aime les puces électronique" "j'aime la mémoire miam miam !" "j'aime les transistors" "j'aime les leds lumineuse" "j'aime manger de tout")
echo "$resultat1, ${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QUESTIONHASARD7 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Marié ?
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD7.txt
citations=("moi je suis marié avec jibé mon créateur" "j'aimerai que ce soit avec celui qui m'a fait, jibé es-tu ok ?" "j'aimerai mais avec qui ? tu as une idée ?" "je ne sais pas ce que c'est être marié, on s'amuse bien ?" "c'est bien d'être marié ?" "pas encore et toi ? es-tu heureux depuis ?")
echo "$order $(jv_pg_ct_ReponsePREAFFIRMATIVE), mon mari ... ${citations[$RANDOM % ${#citations[@]} ]} "
}

jv_pg_ct_QUESTIONHASARD8 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
# Combien de Frère et Sœurs 
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD8.txt

citations1=("$order Génial, " "$order Excellent, " "$order Super, " "$order Ouaou, " "$order Moi, " "$order, de mon coté, " "$order Ha oui !,")

citations=(" Personnelement" " moi " "nous sommes une famille nombreuse " "çar" "en tout " "voilà  , ")

citations2=("j'ai 2 fréres et 2 soeurs" "j'ai 2 soeurs, Alicia et Justine, et 2 frères Lorenzo et Valentin" "j'ai 2 soeurs, Alicia et Juju, et 2 frères Lorenzo et Vava")
# echo "${citations[$RANDOM % ${#citations[@]} ]} 

echo "${citations1[$RANDOM % ${#citations1[@]} ]} ${citations[$RANDOM % ${#citations[@]} ]} ${citations2[$RANDOM % ${#citations2[@]} ]}"
}


jv_pg_ct_QUESTIONHASARD9 () {
jv_pg_ct_STOP
jv_pg_ct_verifavecquijeparle1
echo "$order" > $CHEMIN/$NOMAQUI/QUESTIONHASARD9.txt

# Je te plais ?
citations=("en cours de traitement")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_MERCI () {
jv_pg_ct_STOP
citations=("de rien... " "il n'y a pas de quoi..." "A ton service" "Je t'en prie" "Merci de me dire merci..." "J'apprécie..." "c'est naturel.." "J'adore la politesse..." "J'aime quand on est poli avec moi")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_FINDECONVERSAION () {
jv_pg_ct_STOP
citations=("Je suis HS... j'arrête la conversation, désolé." "Désolé, je vais me reposer... je stop la conversation..." "Ce fut génial notre conversation mais je dois y aller au revoir..." "Je suis pressé je dois y aller Au revoir..." "Il est tant pour moi d'y aller, je coupe la conversation... Désolé..." "Je te souhaite une bonne journée, je dois y aller...Désolé..." "Fin de la communication, je dois aller régler mes problèmes de puces informatiques... Désolé..." "Je suis obligé d'y aller, je coupe notre conversation...")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_HISTOIRCOURTE () {
jv_pg_ct_STOP
citations=("J'ai ouvert mon placard, Et j'ai raconté une blague à  mes vêtements...Ils étaient pliés !!!" "L'intelligence, c'est comme un parachute : quand on n'en a pas, on s'écrase !" "Si la matière grise était rose, personne n'aurait plus d'idées noires." "Pourquoi une blonde jette-t-elle un seau d'eau sur son ordinateur ? Réponse pour surfer sur internet ?" "c'est tu ce que signifie P C ? Plantage Constant..." "Une femme discute avec une amie : J'ai un mari en or. L'autre lui répond: le mien, il est en taule." "Deux asticots se retrouvent dans une pomme : - Tiens ! Je na savais pas que vous habitiez le quartier !")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_AVEZDIT () {
jv_pg_ct_STOP
citations=("Tu m'avez dit la dernière fois" "j'avais enregistré la dernière fois" "à  notre dernière conversation tu m'avais dit" "Tu m'avais dit" "Souviens-tu que tu m'avez dit" "Tu te souviens que tu m'as dit" "Te souviens-tu quand tu m'as dit")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_PASCOMPRIS () {
jv_pg_ct_STOP
citations=("Je n'ai pas saisie ce que tu me demandes... " "Quoi ? qu'est ce que tu dis ?" "Reformule mieux je ne comprends pas !" "Je ne parle pas le petit chinois, répète ?" "Articules mieux j'ai pas compris ?" "Peux-tu répéter, je suis sourd d'oreille" "Mauvaise formulation, que dis-tu ?" "Je n'ai pas appris ce ue tu souhaites, reformule" "Demandes-moi le autrement, je n'ai pas saisie..." "Quoi que dis-tu ? " "Langage non saisie,  que dis-tu ? ")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}










