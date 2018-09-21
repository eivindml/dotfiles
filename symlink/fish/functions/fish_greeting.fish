function fish_greeting
  set tod (date +"%H")
  if test $tod -lt 12 -a $tod -gt 5
    printf "Good morning! ☀️"
  else if test $tod -lt 17
    printf "Good afternoon! 🌍"
  else if test $tod -lt 21
    printf "Good evening! 🌗"
  else
    printf "Good night! 🌒"
  end
  printf "\n\n"
end
