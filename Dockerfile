FROM elixir:1.12.0-alpine

RUN apk update && apk upgrade && \
  apk add bash postgresql-client \
  chromium chromium-chromedriver inotify-tools \
  nodejs yarn && \
  rm -rf /var/cache/apk/*

RUN mkdir /app
COPY . /app

WORKDIR /app
RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
RUN chmod +x entrypoint.sh
CMD ["/app/entrypoint.dev.sh"]
