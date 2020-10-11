FROM elixir:alpine

ARG DATABASE_URL_ARG=${DATABASE_URL_ARG}
ARG SECRET_KEY_BASE_ARG=${SECRET_KEY_BASE_ARG}

ENV DATABASE_URL=$DATABASE_URL_ARG
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE_ARG

RUN echo $DATABASE_URL

WORKDIR /usr/src/geoguessr_party

COPY . .

# Server

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get

RUN MIX_ENV=prod mix compile

# Assets

RUN npm install --prefix assets
RUN npm run deploy --prefix ./assets

RUN mix phx.digest

# Start

EXPOSE 4001

CMD PORT=4001 MIX_ENV=prod mix phx.server