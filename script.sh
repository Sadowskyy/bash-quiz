# shellcheck disable=SC2034
question_file = quiz_pytania.txt
score = 0

#Sprawdzamy czy są pytania
if [ ! -f question_file ]
then
    echo "Nie mam pytań do quizu"
    exit 1
fi
