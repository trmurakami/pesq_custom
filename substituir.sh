#!/bin/bash

# Diretórios de origem e destino
origem="../pesq_custom"
destino="../pesq"

# Verifica se o diretório de origem existe
if [ ! -d "$origem" ]; then
  echo "Diretório de origem não encontrado!"
  exit 1
fi

# Verifica se o diretório de destino existe
if [ ! -d "$destino" ]; then
  echo "Diretório de destino não encontrado!"
  exit 1
fi

# Varre o diretório de origem e copia os arquivos para o diretório de destino, incluindo subdiretórios
find "$origem" -type f ! -path "*/.git/*" | while read -r arquivo; do
  # Cria o caminho do arquivo no diretório de destino
  caminho_destino="$destino${arquivo#$origem}"
  
  # Cria o diretório de destino se não existir
  mkdir -p "$(dirname "$caminho_destino")"
  
  # Copia o arquivo para o diretório de destino
  cp -f "$arquivo" "$caminho_destino"
  echo "Arquivo $(basename "$arquivo") substituído no diretório de destino."
done

echo "Substituição de arquivos concluída!"