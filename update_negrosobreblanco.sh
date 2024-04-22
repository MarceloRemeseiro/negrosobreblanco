#!/bin/bash

# Nombres fijos
CONTAINER_NAME=negrosobreblanco
IMAGE_NAME=negrosobreblanco
SCRIPT_DIR=$(dirname "$0")  # Obtiene el directorio del script

# Detener y eliminar el contenedor
echo "Deteniendo y eliminando el contenedor actual..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Borrar la imagen
echo "Eliminando la imagen Docker..."
docker rmi $IMAGE_NAME

# Actualizar el código fuente
echo "Actualizando el código fuente desde Git..."
cd $SCRIPT_DIR
git pull

# Reconstruir la imagen Docker
echo "Construyendo la nueva imagen Docker..."
docker build -t $IMAGE_NAME .

# Iniciar el nuevo contenedor
echo "Iniciando el nuevo contenedor..."
docker run -d --name $CONTAINER_NAME --restart=always -p 1000:8080 $IMAGE_NAME

# Limpiar imágenes "dangling"
echo "Limpiando imágenes sin usar..."
docker image prune -f

echo "Actualización completada y contenedor reiniciado."

