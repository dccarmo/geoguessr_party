FROM postgres:alpine

RUN apk add elixir

RUN echo y | mix local.hex