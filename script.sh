# shellcheck disable=SC2034
question_file = quiz_pytania.txt
score = 0

#Sprawdzamy czy są pytania
if [ ! -f question_file ]; then
  echo "Nie mam pytan do quizu"
  exit 1
fi

if [ $score ] >0; then
  echo "Spróbuj ponownie kiedys :D"
  echo "Twoja liczba punktow: $score/$(wc -l question_file)"
fi

else
  echo "Gratulacje"
  echo "Twoja liczba punktow: $score/$(wc -l question_file)"
fi