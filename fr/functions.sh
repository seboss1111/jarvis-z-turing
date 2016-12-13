#!/bin/bash

jv_pg_ct_verifavecquijeparle () {
if [ "$NOMAQUI" = " " ]; then
echo "Mais je ne te connais pas !"
echo "$(jv_pg_ct_avecquijeparle)"
fi
}


jv_pg_ct_STOP () {
if [ "$order" = "stop" ]; then
echo "STOP enregistré... "; commands="$(jv_get_commands)"; jv_handle_order "GOTO4"; return
fi
}


jv_pg_ct_moicest () {
jv_pg_ct_verifavecquijeparle

  citations=("mois c'est $trigger" "je m'appelle Jarvis $trigger" "mon nom est Jarvis $trigger" "on m'appelle Jarvis $trigger" "je suis Jarvis $trigger" "on me nomme Jarvis $trigger")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_jesuisavec () {
NOMAQUI=`echo $(cat ~/nomaqui.txt)`
  citations=("tu es bien $NOMAQUI" "c'est bien $NOMAQUI qui me parle ?" "est-ce bien $NOMAQUI ?" "c'est $NOMAQUI ?" "c'est toi $NOMAQUI ?" "Je ne te reconnais pas c'est $NOMAQUI ?")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_avecquijeparle () {
  citations=("ok, Comment tu t'appelle ?" "oui, Quel est ton nom ?" "ok mais d'abord quel est ton nom ?" "très bien je te pose la première question quel est ton nom ?" "et quel es ton petit nom ?" "comment puis je t'appeler" " Ok qui me parle ?")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_bonjournom () {
NOMAQUI=`echo $(cat ~/nomaqui.txt)`
  citations=("Bonjour $NOMAQUI," "Héllo $NOMAQUI," "Enchanté $NOMAQUI," "Bienvenue $NOMAQUI," "A que coucou $NOMAQUI," "Coucou $NOMAQUI," "Salut $NOMAQUI,")
  echo "${citations[$RANDOM % ${#citations[@]} ]}"
}



jv_pg_ct_citationt () {
jv_pg_ct_verifavecquijeparle

    citations=("Tu veux parler de quoi ?" "Je t'écoute, que veux-tu ?" "Ok, je suis prét, que souhaites tu ?" "Dis moi, je t'écoute ?" "Quel question veux tu me poser ?" "Qu'est ce qui t'arrive ?" "Que veux tu, je t'écoute ?" "Pose moi ta question ?" "J'ai 5 minutes que veux tu ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_renvoiquestion () {
jv_pg_ct_verifavecquijeparle

citations=("1 Tu as quel age ?" "2 Quel est ta couleur préféré ?" "3 Quel sport aime tu faire ? " "4 est-ce que ca va ?" "5 Quel est ton film préféré ? " "6 qu'est ce que tu aimes manger ?" "7 Tu es marié ?" "8 Tu as combien de frères et soeur ?")


 [ $(grep -o "age" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD1
 [ $(grep -o "couleur" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD2
 [ $(grep -o "sport" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD3
 [ $(grep -o "film" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD5
 [ $(grep -o "manger" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD6
 [ $(grep -o "mari�" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD7
 [ $(grep -o "fr�re" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD8
 [ $(grep -o "soeur" <<< "$order") ] && jv_pg_ct_QUESTIONHASARD8

   
    citations=("$order Pourquoi cette question ? $NOMAQUI " "$order c'est à dire" "Que veux tu exactement ?" "Pour quoi faire ?" "$order Demande moi le plus gentiement ?" "$order Qu'est ce qui t'intrigue la" "Et alors qu'est ce qui ne va pas ?" "$order ? En quoi puis je t'aider") 
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_pourquoi () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi quoi ? $NOMAQUI" "Je te renvoie la question ? " "Je n'en sais rien, as tu une idée ?" "Je ne sais pas du tout ?" "Quel bonne question ! Par ce que !?" "Il peut y avoir tellement de réponse...")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_ettoi () {
jv_pg_ct_verifavecquijeparle
    citations=("Et toi que me répondrais tu ? $NOMAQUI" "Tu dirais quoi toi ? " "Que me répondrai-tu ?" "Dit moi toi d'abord ?" "Je te repose la même question ?" "Qu'en penses tu toi ?" "admeton que je soit toi, que dirais tu ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_questionON () {
jv_pg_ct_verifavecquijeparle
    citations=("$order, A ma place, tu dirais oui ou non ? $NOMAQUI" "$order, C'est une question fermée ? " "$order, Si je te dis oui tu réponds quoi ? " "$order, Si je te dis non tu réponds quoi ? " "$order, C'est oui ou non ?" "$order, A toi de me dire Oui ou Non ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_ReponseO () {
jv_pg_ct_verifavecquijeparle
    citations=("Oui trés bien $NOMAQUI" "Merveilleusement bien merci" "Ca va mieux qu'hier" "Je suis en forme" "Parfaitement bien" "Nickel chrome $NOMAQUI" "je me sens génialement bien" "en pleine forme" "oui tranquillement")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_ReponseN () {
jv_pg_ct_verifavecquijeparle
    citations=("Non pas vraiment, $NOMAQUI" "Non pas du tout" "a peut aller mieux" "Je ne suis pas en forme" "Un peu fatigué" "ca pourrait aller mieux" "il y a des jours sans mais ca va aller mieux" "j'ai mal dormi du coup je suis fatigué" "je me suis pris la tête avec mes données binaires")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_ReponsePoitive () {
jv_pg_ct_verifavecquijeparle
    citations=("A parfait, $NOMAQUI, continue comme ca" "Ok tant mieux" "c'est trés bien" "J'en suis heureuse" "Je suis satisfaite de l'entendre" "continue a être positif" "j'adore t'entendre parler ainsi" "ho oui $NOMAQUI c'est génial")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_ReponsePREAFFIRMATIVE () {
jv_pg_ct_verifavecquijeparle
    citations=("A parfait " "Ok " "c'est bien" "j'adore " "ho oui " "c'est génial" "parfait" "daccord" "merveilleux" "ha ! " "j'aurais pas cru" "je ne l'avais pas deviné")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QuetionouverteN () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi ?, $NOMAQUI" "C'est à dire ?" "Mais encore ? pourquoi ca ne va pas" "Depuis quand ?" "Pourquoi c'est si dur que ca ?" "Continue ?" "Développe un peu plus" "Que dirais tu de plus ?" "Tu en penses quoi ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QuetionouverteP () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi ?, $NOMAQUI" "C'est à dire ?" "Mais encore ? pourquoi ca va si bien " "Depuis quand ?" "C'est si bien que ca ?" "Continue ?" "Développe un peu plus" "Que dirais tu de plus ?" "Tu en penses quoi ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_RenvoieQuetionP () {
jv_pg_ct_verifavecquijeparle
    citations=("Que peux tu faire pour que ca aille mieux ?, $NOMAQUI" "il te faut être plus positif ok ?" "Fait de ton mieux Ok ?" "Tu peux changer la donne, n'est ce pas ?" "Il y a pire que ca on est ok ?" "Il y a toujours une solution n'est ce pas ?" "Aller courage, je sais que tu en as pas vrai $NOMAQUI ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_OUI () {
jv_pg_ct_verifavecquijeparle
    citations=("Ca au moins c'est positif ?, $NOMAQUI" "Continue comme ca..." "Et pourquoi pas non ?" "Oui moi aussi... " "Je suis fier de l'entendre")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_NON () {
jv_pg_ct_verifavecquijeparle
    citations=("Pourquoi non ?, $NOMAQUI" "et si tu disait oui ?" "parle positif..." "Reprends ta réponse !" "ok c'est ton dernier mot ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


jv_pg_ct_PASSUR () {
jv_pg_ct_verifavecquijeparle
    citations=("Comment ca pas sur ?, $NOMAQUI" "Ha bon ?" "Et Pourquoi ?" "C'est à dire ?" "il y a toujours mieux de pas sur..." "ha... c'est ton dernier mot ?")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_RIRE () {
jv_pg_ct_verifavecquijeparle
    citations=("Toi aussi tu me fais rire !, $NOMAQUI" "Sacré $NOMAQUI" "Tu as le sens de l'humour..." "Ca me fait rire aussi ?" "Je souris... Ca se voit ?" "ha... ha ha !" "très drôle !" "tu es rigolo !")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_GROSMOT () {
jv_pg_ct_verifavecquijeparle
    citations=("Et bien que vous êtes grossier !! Vous devriez parler mieux que cela !!" "C'est pas bien ce ue vous dites, $NOMAQUI" "Tu as le sens de l'humour..." "Aprends a parler mieux s'il te plait" "Je suis outrait !" "Que dis tu vilain personnage" "C'est pas moi qui parle comme ca")
    echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_MOTIVATION () {
jv_pg_ct_verifavecquijeparle
 citations=("Fais quelque chose pour te motiver" "Va danser ca ira mieux, $NOMAQUI" "Va faire un peu de sport !" "Tu es seul au monde, mon pauvre petit ?" "Moi aussi... snif..." "Regarde la Télévision" "Fait un calin à quelqu'un" "Si seulement je pouvais te serrer dans les bras" "Changes tes idées")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QUESTIONHASARD () {
jv_pg_ct_verifavecquijeparle
# citations=("1 Tu as quel âge ?" "2 Quel est ta couleur préféré ?" "3 Quel sport aime tu faire ? " "4 Qui est ta chérie ?" "5 Quel est ton film préféré ? " "6 qu'est ce que tu aimes manger ? " "7 Tu es marié ?" "8 Tu as combien de frères et soeur ?" "9 Est-ce que je te plait ?")
citations=("1 Tu as quel age ?" "2 Quel est ta couleur préféré ?" "3 Quel sport aime tu faire ? " "4 est-ce que ca va ?" "5 Quel est ton film préféré ? " "6 qu'est ce que tu aimes manger ?" "7 Tu es marié ?" "8 Tu as combien de frères et soeur ?")
 lacita=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`
 QUESTIONHASARD=`echo "$lacita" | cut -c3-`
echo $QUESTIONHASARD
 choixQUESTIONHASARD=`echo "$lacita" | cut -d" " -f1`

echo "" > ~/choixquestion.txt 
echo "jv_pg_ct_QUESTIONHASARD$choixQUESTIONHASARD" >> ~/choixquestion.txt

}

jv_pg_ct_QUESTIONHASARD1 () {
jv_pg_ct_STOP
# Tu as quel age

AGE=`echo "$order" | cut -d" " -f1`

if [ "$AGE" -le "13" ]; then
echo "Tu es encore un enfant de $AGE ans !, écoute tes parents car il t'aime beaucoup"
fi

if ([ "$AGE" -ge "14" ] && [ "$AGE" -le "17" ]); then
echo "Tu es un adolescent de $AGE ans !, soit fort et positif durant toute cette phase là, et tu grandiras comme un vrai homme !"
fi

if [ "$AGE" = "18" ]; then
echo "$AGE ans ! Te voilà Majeur !!! ouaouuuu !"
fi

if ([ "$AGE" -ge "31" ] && [ "$AGE" -le "38" ]); then
echo "Ha $AGE ans ! Papa dans l'ame et tu es signé pour tes enfants pour... heuuuuu, pour... la vie !"
fi

if ([ "$AGE" -ge "39" ] && [ "$AGE" -le "42" ]); then
echo "$AGE ans j'espère que tu franchira facilement la crise de la quarantaine !"
fi

if ([ "$AGE" -ge "43" ] && [ "$AGE" -le "60" ]); then
echo "$AGE ans, tu es à la moitié de ta vie... il te reste encore tout un long chemin à faire... avec une bonne reflexion sur soit même et la vie..."
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

citations=("tu vas encore grandir !" "Un an de plus tous les 365 jours" "tant que le coeur bat, la vie pousse" "il y a encore plein de belles choses à accomplir" "la vie nous mênne à faire plain de chose encore" "aller jour aprês jour on finira par avoir 1 an de plus ")
echo "${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_PREPOSITIONSAFFIMATIVE () {
citationsa=("$order original," "ca me va le $order" "tres bien $order" "ca te plait $order" "interessant $order " "pourqyoi pas $order" "du $order" "c'est ainsi que $order te plait" "Ok tu aimes le $order," "le $order, " "daccord pour toi c'est le $order" "Ha ! le $order" "Hummm le $order" "intérrésant le $order," "j'aime beaucoup le $order, " "j'aime bien aussi le $order" "Cool le $order,")
echo "${citationsa[$RANDOM % ${#citationsa[@]} ]}"
}


jv_pg_ct_QUESTIONHASARD2 () {
jv_pg_ct_STOP
# Couleur ?

citationsa=("Ok tu aimes le $order," "le $order, " "daccord pour toi c'est le $order" "Ha ! le $order" "Hummm le $order" "intérrésant le $order," "j'aime beaucoup le $order, " "j'aime bien aussi le $order" "Cool le $order,")
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
# Sport
resultat=`jv_pg_ct_PREPOSITIONSAFFIMATIVE`
resultat1=$(jv_pg_wk_search "$order")
if [ "$resultat1" = "Je n'ai rien trouvé" ]; then 
resultat1="Je n'ai rien trouvé de mieux"
fi
citations=("le traitement informatique" "créer des programmes" "la domotique" "envoyer des emails" "faire des calculs" "jouer au plus petit ou plus grand" "faire la puce informatique" "surfer sur le net" "aller sur des nouveau site internet")
resultat2=`echo "${citations[$RANDOM % ${#citations[@]} ]}"`
citations2=("ce n'est pas vraiment du sport je sais bien." "Dans ma petite boite informatique ou je suis je ne peux pas faire autrement" "je ne suis qu'un ordinateur" "je vais te faire rire mais je ne peux pas me déplacer !" "et oui je n'ai pas la possibilité de faire autrement n'est ce pas !" "Tu as la chance d'être un être humain !" "Toi avec tes 5 sens tu asp lus de possibilité que moi" "je fais avec mes moyens" "je fais comme je peux" "je fais ce que je sais faire")
resultat3=`echo ${citations2[$RANDOM % ${#citations2[@]} ]}`
echo "$resultat, $resultat1, moi j'aime $resultat2. $resultat3"
}

jv_pg_ct_QUESTIONHASARD4 () {
jv_pg_ct_STOP
# Est ce que ca va?
if [ "$order" = "oui" ]; then 
citations=("a tant mieux" "je suis content" "cool" "Ca fait du bien a attendre car quand ca va pour les autres ca va pour soit" "c'est une bonne nouvelle" "ravi pour toi")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
fi

if [ "$order" = "non" ]; then 
citations=("a bon ! ca ne va pas ? raconte " "A mince qu'est ce qu'il t'arrive ?" "Tu veux en parler ?" "Et pourquoi ?")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
fi


}

jv_pg_ct_QUESTIONHASARD5 () {
jv_pg_ct_STOP
# Film ?
citations=("James Bond, agent zéro zéro 7" "Agenger" "Super man" "l'émission super Nani")
 echo "$order ok, Mon film préféré est ${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QUESTIONHASARD6 () {
jv_pg_ct_STOP
# Gourmand
resultat1=$(jv_pg_wk_search "$order")
if [ "$resultat1" = "Je n'ai rien trouvé" ]; then 
resultat1="Je n'ai rien trouvé de mieux"
fi

citations=("moi j'aime toutes sortes de 1 et de 0" "j'aime les circuits élèctronique" "j'aime manger les composants informatique" "j'aime les puces élèctronique" "j'aime la mémoire mia miam !" "j'aime les transistors" "j'aime les led lumineuse" "j'aime manger de tout")
echo "$resultat1, ${citations[$RANDOM % ${#citations[@]} ]}"
}

jv_pg_ct_QUESTIONHASARD7 () {
jv_pg_ct_STOP
# Marié ?
citations=("moi je suis marié avec jibé mon créateur" "j'aimerai que ce soit avec celui qui m'a fait, jibé es-tu ok ?" "j'aimerai mais avec qui ? tu as une idée ?" "je ne sais pas ce que c'est étre marié, on s'amuse bien ?" "c'est bien d'être marié ?" "pas encore et toi ? es-tu heureux depuis ?")
echo "$order $(jv_pg_ct_ReponsePREAFFIRMATIVE), mon mari ... ${citations[$RANDOM % ${#citations[@]} ]} "
}

jv_pg_ct_QUESTIONHASARD8 () {
jv_pg_ct_STOP
# Combien de Frère et Soeur 
citations1=("$order Génial, " "$order Excellent, " "$order Super, " "$order Ouaou, " "$order Moi, " "$order, de mon coté, " "$order Ha oui !,")

citations=(" Personnelement" " moi " "nous sommes une famille nombreuse " "car" "en tout " "voilà, ")

citations2=("j'ai 2 fréres et 2 soeurs" "j'ai 2 soeurs, Alicia et Justine, et 2 frères Lorenzo et Valentin" "j'ai 2 soeurs, Alicia et Juju, et 2 frères Lorenzo et Vava")
# echo "${citations[$RANDOM % ${#citations[@]} ]} 

echo "${citations1[$RANDOM % ${#citations1[@]} ]} ${citations[$RANDOM % ${#citations[@]} ]} ${citations2[$RANDOM % ${#citations2[@]} ]}"
}

jv_pg_ct_QUESTIONHASARD9 () {
jv_pg_ct_STOP
# Je te plais ?
citations=("en cours de traitement")
 echo "${citations[$RANDOM % ${#citations[@]} ]}"
}


