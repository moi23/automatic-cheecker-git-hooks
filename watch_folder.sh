#!/bin/bash

# O nome da pasta a ser observada
folder_to_watch="./android"
echo "Rodando"

# Inicialmente, verificamos se a pasta existe
if [ ! -d "$folder_to_watch" ]; then
  echo "A pasta $folder_to_watch não existe!"
  exit 1
fi

# Usamos o comando "git ls-files" para verificar se houve alterações na pasta
while true; do
  # Verificamos se houve alterações na pasta
  changes=$(git ls-files -m "$folder_to_watch")

  # Se houve alterações, adicionamos todas elas ao índice do Git e fazemos o commit
  if [ -n "$changes" ]; then
    git add -A
    git commit -m "Alterações na pasta android detectadas"
  fi

  # Dormimos por 60 segundos antes de verificar novamente
  sleep 60
  echo "Rodando"

done
