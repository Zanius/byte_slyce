FROM elixir:1.12.0-alpine

RUN apk update && apk upgrade && \
  apk add postgresql-client && \
  apk add bash chromium chromium-chromedriver inotify-tools && \
  apk add nodejs npm && \
  rm -rf /var/cache/apk/*

RUN mkdir /app
COPY . /app

WORKDIR /app
RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
RUN chmod +x entrypoint.sh
CMD ["/app/entrypoint.sh"]
