# Utiliza una imagen base de Python
FROM python:3.11-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de la aplicación al directorio de trabajo
COPY . .

# Instala las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update
RUN apt-get install -y curl
# Expone el puerto en el que el servicio FastAPI estará escuchando
EXPOSE 8000

# Comando para ejecutar el servidor FastAPI
CMD ["python", "./src/main.py"]
