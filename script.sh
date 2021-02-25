# shellcheck disable=SC2034
question_file = quiz_pytania.txt
score = 0

#Sprawdzamy czy są pytania
if [ ! -f question_file ]; then
  echo "Nie mam pytan do quizu"
  exit 1
fi
#Glowna petla
while read -u9 line
do
    # parsing quiz file for current question
    question=`echo $line | cut -f1 -d' '`
    choisces=
    (
    `echo $line | cut -f2 -d' '`
    `echo $line | cut -f3 -d' '`
    `echo $line | cut -f4 -d' '`
    `echo $line | cut -f5 -d' '`)



    # wyswielt pytania i odpowiedzi
    sub_string='TRUE'
    echo "$question"
    for choisce in "${choisces[@]}"
    do
      if [ $choisce == *"$sub_string*"]; then
          simplifiedChoice = ${choisce::-4}
          echo "$simplifiedChoice"
      fi
      else
           echo "$choisce"
      fi
    done

    # Zczytaj odpowiedz
    echo "Wprowadz "
    read -p "- Twoja odpowiedz: " player_choice

    #    Sprawdz czy to dobra odpowiedz
    for choisce in "${choisces[@]}"
    do
      if [ $choisce == *"$sub_string*"]; then
          solution = ${choisce::-4}
          if [ $player_choice == $solution ]; then
                      score=$(( ++score ))
                      echo "Dobra odpowiedz"
          fi
          else
                      echo "Zla odpowiedz, dobra odpowiedz to: $solution"
          fi
      fi
    done

done 9< question_file

#Wyswietl punkty na koniec
if [ $score  >0 ]; then
  echo "Spróbuj ponownie kiedys :D"
  echo "Twoja liczba punktow: $score/$(wc -l question_file)"
fi

else
  echo "Gratulacje"
  echo "Twoja liczba punktow: $score/$(wc -l question_file)"
fi