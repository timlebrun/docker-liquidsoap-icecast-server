FROM savonet/liquidsoap:v1.4.3

ENV HTTP_PORT=80
ENV HTTP_PATH="/"

ENV ICECAST_USERNAME="hackme"
ENV ICECAST_PASSWORD="hackme"
ENV ICECAST_PATH=${HTTP_PATH}
ENV ICECAST_PORT=${HTTP_PORT}

ENV HLS_PATH=${HTTP_PATH}
ENV HLS_PORT=${HTTP_PORT}

ENV S3_ACCESS_KEY="none"
ENV S3_SECRET_KEY="none"
ENV S3_ENDPOINT="none"
ENV S3_REGION="none"
ENV S3_BUCKET="none"
ENV S3_PATH="none"


# Install node for basic scripting
RUN apt update
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install -y nodejs
RUN npm install -g envhandlebars

COPY ./index.html /var/www/index.html
COPY ./http.liq ./http.liq
COPY ./script.liq ./template.liq

EXPOSE 80

# Render template according to ENV, then start engine
CMD envhandlebars < ./template.liq > ./script.liq && \
  liquidsoap --version && \
  liquidsoap ./script.liq
