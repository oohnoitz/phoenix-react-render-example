use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :PhoenixReactRenderExample, PhoenixReactRenderExampleWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    npm: [
      "run",
      "build",
      "--",
      "--watch-stdin",
      "--progress",
      "--color",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# Watch static and templates for browser reloading.
config :PhoenixReactRenderExample, PhoenixReactRenderExampleWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/PhoenixReactRenderExample_web/views/.*(ex)$},
      ~r{lib/PhoenixReactRenderExample_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :PhoenixReactRenderExample, PhoenixReactRenderExample.Repo,
  username: "postgres",
  password: "postgres",
  database: "PhoenixReactRenderExample_dev",
  hostname: "localhost",
  port: String.to_integer(System.get_env("PGPORT") || "5432"),
  pool_size: 10,
  types: PhoenixReactRenderExample.PostgresTypes

config :PhoenixReactRenderExample, PhoenixReactRenderExample.Mailer, adapter: Bamboo.LocalAdapter

if File.exists?(Path.join([__DIR__, "dev.secret.exs"])) do
  import_config "dev.secret.exs"
end
