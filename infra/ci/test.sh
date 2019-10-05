#!/bin/bash

apt-get update
apt-get install -y build-essential inotify-tools postgresql postgresql-client
# allow access from any local client as `postgres` user
cat > /etc/postgresql/*/main/pg_hba.conf <<-EOF
host  all postgres localhost trust
EOF


# start postgres
service postgresql start

mix local.hex --force
mix local.rebar --force
mix archive.install hex phx_new $PHOENIX_VERSION --force

cd myapp

input="secret.env.example"
while IFS= read -r line
do
    cat >> secret.env <<-EOF
export $line
EOF
done < "$input"

source secret.env

mix deps.get
mix test
