use Mix.Config
# NOTE: Compile-time production configuration goes here

config :PhoenixReactRenderExample, PhoenixReactRenderExampleWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true,
  root: ".",
  version: Application.spec(:PhoenixReactRenderExample, :vsn)

config :PhoenixReactRenderExample, PhoenixReactRenderExample.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true,
  types: PhoenixReactRenderExample.PostgresTypes

# Do not print debug messages in production
config :logger, level: :info

config :rollbax, enable_crash_reports: true

config :PhoenixReactRenderExample, PhoenixReactRenderExample.Mailer,
  adapter: Bamboo.SendGridAdapter,
  api_key: System.get_env("SENDGRID_API_KEY")
