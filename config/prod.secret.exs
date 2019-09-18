# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

config :myapp, Myapp.Repo,
  # ssl: true,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "20")

config :myapp, MyappWeb.Endpoint,
  http: [:inet6, port: 4000],
  url: [host: "0.0.0.0", port: 4000],
  secret_key_base: "${SECRET_KEY_BASE}",
  server: true,
  root: ".",
  version: Application.spec(:phoenix_distillery, :vsn)
