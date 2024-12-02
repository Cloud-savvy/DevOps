FROM ubuntu:latest
WORKDIR /var/www/html
RUN apt-get update && apt-get -y install apache2 zip unzip && \
    wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip && \
    unzip neogym.zip && \
    cp -rvf neogym/* /var/www/html && \
    rm -rf neogym neogym.zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
EXPOSE 80
CMD ["apache2", "-D", "FOREGROUND"]
