# Imagen base
FROM ubuntu:latest

# Actualizar el sistema
RUN apt-get update -y
RUN apt-get upgrade -y

# Instalar dependencias necesarias
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Instalar Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="$PATH:/usr/local/flutter/bin"

# Añadir Flutter al PATH del sistema
RUN flutter precache
RUN flutter config --enable-web

# Crear directorio de la aplicación
WORKDIR /app

# Copiar el archivo pubspec.yaml y obtener dependencias
COPY ./pubspec.* ./
RUN flutter pub get

# Copiar el resto de los archivos de la aplicación
COPY . .

# Compilar la aplicación para la web
RUN flutter build web

# Exponer el puerto 2024 (puerto por defecto para Flutter web)
EXPOSE 2024

# Comando para ejecutar la aplicación Flutter web
CMD ["flutter", "run", "-d", "web-server", "--web-port", "2024", "--release"]
