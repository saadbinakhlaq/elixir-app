use Mix.Config

config :myapp, Myapp.Repo,
  username: "postgres",
  password: "postgres",
  database: "myapp_test",
  hostname: System.get_env("DB_HOST") || "db",
  pool: Ecto.Adapters.SQL.Sandbox

config :myapp, MyappWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
