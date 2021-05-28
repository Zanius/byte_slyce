FROM elixir:latest

RUN curl -fsSL https://deb.nodesource.com/setup_14.x  | bash -

RUN apt-get update \
  && apt-get install -y postgresql-client nodejs inotify-tools

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force

RUN mix deps.get
RUN mix local.rebar --force
RUN mix do compile

RUN npm install --prefix assets

CMD ["/app/entrypoint.sh"]
