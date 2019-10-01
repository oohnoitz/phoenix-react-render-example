import Config
# NOTE: Runtime production configuration goes here

config :PhoenixReactRenderExample, PhoenixReactRenderExample.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :PhoenixReactRenderExample, PhoenixReactRenderExampleWeb.Endpoint,
  http: [port: String.to_integer(System.get_env("PORT"))],
  url: [scheme: "https", host: System.get_env("APP_DOMAIN"), port: 443],
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :rollbax,
  client_token: System.get_env("ROLLBAR_CLIENT_TOKEN"),
  access_token: System.get_env("ROLLBAR_SERVER_TOKEN"),
  environment: System.get_env("ROLLBAR_ENVIRONMENT"),
  # TODO: turn on when your app is deployed
  enabled: false

config :PhoenixReactRenderExample, :statix,
  prefix: "PhoenixReactRenderExample",
  host: System.get_env("DATADOG_HOST") || "100.66.67.91",
  port: String.to_integer(System.get_env("DATADOG_PORT") || "8125")

config :PhoenixReactRenderExample, PhoenixReactRenderExample.Mailer,
  adapter: Bamboo.SendGridAdapter,
  api_key: System.get_env("SENDGRID_API_KEY")

config :PhoenixReactRenderExample,
  jwt_secret: System.get_env("JWT_SECRET") || System.get_env("SECRET_KEY_BASE")

app_name = System.get_env("APP_NAME") || "PhoenixReactRenderExample"
config :PhoenixReactRenderExample, cluster_topologies: [
  k8s: [
    strategy: Elixir.Cluster.Strategy.Kubernetes.DNS,
    config: [
      # the name of the "headless" service in the app's k8s configuration
      service: "#{app_name}-nodes",
      # the `app` tag applied to k8s resources for this app
      application_name: app_name,
    ]
  ]
]
