FROM elixir:alpine

ARG DATABASE_URL
ARG SECRET_KEY_BASE

ENV DATABASE_URL=$DATABASE_URL
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

WORKDIR /usr/src/geoguessr_party

COPY . .

# Server

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix setup

RUN MIX_ENV=prod mix compile

# Assets

RUN npm run deploy --prefix ./assets

RUN mix phx.digest

# Start

EXPOSE 4001

CMD PORT=4001 MIX_ENV=prod mix phx.server