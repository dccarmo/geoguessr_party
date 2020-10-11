FROM alpine:latest

RUN apk add postgres

RUN apk add elixir

RUN mix local.hex | y