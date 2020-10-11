FROM postgres:alpine

WORKDIR /usr/src/geoguessr_party

COPY . .

RUN apk add elixir

RUN echo y | mix local.hex

RUN mix deps.get --only prod

RUN MIX_ENV=prod mix compile

RUN npm run deploy --prefix ./assets

RUN mix phx.digest

EXPOSE 4001

CMD PORT=4001 MIX_ENV=prod mix phx.server