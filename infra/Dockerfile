FROM elixir:1.9.1-alpine AS builder
ENV DEBIAN_FRONTEND=noninteractive

ENV HOME=/app/ TERM=xterm
# Install Hex+Rebar
RUN mix local.hex --force && \
    mix local.rebar --force
WORKDIR /app
ENV MIX_ENV=prod REPLACE_OS_VARS=true


# Cache elixir deps
COPY mix.exs mix.lock ./
RUN mix deps.get
COPY config ./config
RUN mix deps.compile

COPY . .
RUN MIX_ENV=prod mix distillery.release --env=prod

FROM elixir:1.9.1-alpine
ENV DEBIAN_FRONTEND=noninteractive

RUN addgroup --system --gid 1687 myapp && \
    adduser --system --home /app --ingroup myapp --uid 1687 myapp && \
    chown myapp:myapp /app
RUN apk update
RUN apk add bash

EXPOSE 4000
ENV PORT=4000 MIX_ENV=prod REPLACE_OS_VARS=true SHELL=/bin/bash

WORKDIR /app

COPY --from=builder /app/_build/prod/rel/myapp/releases/0.1.0/myapp.tar.gz .

RUN tar xfz myapp.tar.gz

CMD trap 'exit' INT; ./bin/myapp foreground