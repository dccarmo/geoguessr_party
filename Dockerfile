FROM postgres:alpine

ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV DATABASE_URL=${DATABASE_URL}
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

WORKDIR /usr/src/geoguessr_party

COPY . .

# Elixir

RUN apk add elixir

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get --only prod

RUN MIX_ENV=prod mix compile

# npm

RUN apk add npm

RUN npm install --previs ./assets
RUN npm run deploy --prefix ./assets

RUN mix phx.digest

# Start

EXPOSE 4001

CMD PORT=4001 MIX_ENV=prod mix phx.server