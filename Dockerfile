FROM bitnami/laravel
# RUN apt-get update -y && apt-get install -y openssl zip unzip git
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY . .
COPY .env.ci .env
COPY ./app ./app
COPY ./bootstrap ./bootstrap
COPY ./config ./config
COPY ./database ./database
COPY ./logs ./logs
COPY ./public ./public
COPY ./resources ./resources
COPY ./routes ./routes
COPY ./storage ./storage
COPY ./tests ./tests
RUN composer install
RUN php artisan key:generate
ENTRYPOINT [ "php","artisan","serve" ]
CMD ["--port=8080" ]