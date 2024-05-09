# Usa la imagen de Ubuntu como base
FROM ubuntu:latest

# Actualiza el sistema y instala Apache, PHP y Git
RUN apt-get update && \
apt-get install -y apache2 php git
RUN rm -rf /var/www/html/*

# Expone el puerto 80 para acceder a Apache
EXPOSE 80

# Descarga la aplicación web PHP desde un repositorio git y la copia al directorio de Apache
RUN git clone https://github.com/aeimskei/basic-php-website /var/www/html

# Define el comando por defecto para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
