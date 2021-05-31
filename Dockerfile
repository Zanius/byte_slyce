FROM elixir:latest

RUN curl -fsSL https://deb.nodesource.com/setup_14.x  | bash -

RUN apt-get update \
  && apt-get install -y postgresql-client nodejs inotify-tools chromium-driver

RUN node -v

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force

RUN mix deps.get
RUN mix local.rebar --force
RUN mix do compile


WORKDIR /app/assets
RUN npm install
RUN npm rebuild node-sass

WORKDIR /app

CMD ["/app/entrypoint.sh"]
