use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :PhoenixReactRenderExample, PhoenixReactRenderExampleWeb.Endpoint,
  http: [port: 4001],
  server: true

config :PhoenixReactRenderExample, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :PhoenixReactRenderExample, PhoenixReactRenderExample.Repo,
  username: "postgres",
  password: "postgres",
  database: "PhoenixReactRenderExample_test",
  hostname: "localhost",
  port: String.to_integer(System.get_env("PGPORT") || "5432"),
  pool: Ecto.Adapters.SQL.Sandbox,
  types: PhoenixReactRenderExample.PostgresTypes

config :PhoenixReactRenderExample, PhoenixReactRenderExample.Mailer, adapter: Bamboo.TestAdapter

config :PhoenixReactRenderExample,
  s3_signer: PhoenixReactRenderExample.S3Signer.Mock

  config :hound,
  driver: "selenium",
  browser: "chrome",
  app_port: 4001,
  genserver_timeout: 480_000

config :cabbage,
  features: "test/integration/feature_files/"
