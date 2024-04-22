#!/bin/bash

# Nombres fijos
CONTAINER_NAME=negrosobreblanco
IMAGE_NAME=negrosobreblanco
GIT_REPO=https://github.com/MarceloRemeseiro/negrosobreblanco.git  # Asegúrate de actualizar esta ruta

# Detener y eliminar el contenedor
echo "Deteniendo y eliminando el contenedor actual..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Borrar la imagen
echo "Eliminando la imagen Docker..."
docker rmi $IMAGE_NAME

# Actualizar el código fuente
echo "Actualizando el código fuente desde Git..."
cd $GIT_REPO
git pull

# Reconstruir la imagen Docker
echo "Construyendo la nueva imagen Docker..."
docker build -t $IMAGE_NAME .

# Iniciar el nuevo contenedor
echo "Iniciando el nuevo contenedor..."
docker run -d --name negrosobreblanco --restart=always -p 1000:8080 $CONTAINER_NAME $IMAGE_NAME

echo "Actualización completada y contenedor reiniciado."
