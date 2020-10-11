FROM postgres:alpine

RUN apk add elixir

RUN mix local.hex | y