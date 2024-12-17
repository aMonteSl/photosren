#!/bin/sh

if [ -z "$1" ]; then
  echo "Uso: $0 <directorio>"
  exit 1
fi

DIRECTORIO="$1"

if [ ! -d "$DIRECTORIO" ]; then
  echo "El directorio $DIRECTORIO no existe."
  exit 1
fi

FECHA=$(date +%d_%b_%Y)
SUBDIRECTORIO="$DIRECTORIO/$FECHA"
mkdir -p "$SUBDIRECTORIO"


NUM_IMAGENES=$(find "$DIRECTORIO" -maxdepth 1 -type f -exec file --mime-type -b {} + | grep -c '^image/')


LONGITUD_NUM=$(echo "$NUM_IMAGENES" | wc -c)
LONGITUD_NUM=$((LONGITUD_NUM - 1))

CONTADOR=0

for ARCHIVO in "$DIRECTORIO"/*; do
  if [ -f "$ARCHIVO" ]; then
    TIPO=$(file --mime-type -b "$ARCHIVO")
    case "$TIPO" in
      image/*)
        EXTENSION="${ARCHIVO##*.}"
        NOMBRE=$(printf "%0${LONGITUD_NUM}d.%s" "$CONTADOR" "$EXTENSION")
        mv "$ARCHIVO" "$SUBDIRECTORIO/$NOMBRE"
        CONTADOR=$((CONTADOR + 1))
        ;;
    esac
  fi
done

