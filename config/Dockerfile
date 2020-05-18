FROM nginx
RUN apt-get update && \
        apt-get install -y locales && \
		apt-get install dialog && \
        echo "Europe/Kiev" > /etc/timezone && \
        dpkg-reconfigure -f noninteractive tzdata && \
        sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
        echo 'LANG="ru_RU.UTF-8"'>/etc/default/locale && \
        dpkg-reconfigure --frontend=noninteractive locales && \
        update-locale LANG=ru_RU.UTF-8 && \
        # Export env vars
        echo "export LC_ALL=ru_RU.UTF-8" >> ~/.bashrc && \
        echo "export LANG=ru_RU.UTF-8" >> ~/.bashrc && \
        echo "export LANGUAGE=ru_RU.UTF-8" >> ~/.bashrc && \
        apt-get install -y mc && \
        sed -i -e 's/#charset koi8-r;/charset utf-8;/' /etc/nginx/conf.d/default.conf && \
		apt-get install -y php-fpm && apt-get install -y php-mysql && apt-get install -y php && apt-get install -y php-cgi
COPY default.conf  /etc/nginx/conf.d/

