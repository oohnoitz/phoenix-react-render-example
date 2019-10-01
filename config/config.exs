# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :phoenix, :json_library, Jason
config :phoenix, :format_encoders, json: Jason

# General application configuration
config :PhoenixReactRenderExample,
  ecto_repos: [PhoenixReactRenderExample.Repo]

# Configures the endpoint
config :PhoenixReactRenderExample, PhoenixReactRenderExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s23t1MegX76EHELeYRwpIplKdF2OmjhLt+193GQify5HyEWtqZHplUv0ZGcAGDpa",
  render_errors: [view: PhoenixReactRenderExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixReactRenderExample.PubSub, adapter: Phoenix.PubSub.PG2],
  instrumenters: [PhoenixReactRenderExampleWeb.Phoenix.Instrumenter]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :rollbax,
  enabled: false,
  environment: "dev"

config :PhoenixReactRenderExample, PhoenixReactRenderExample.Mailer, adapter: Bamboo.LocalAdapter

config :bamboo, :json_library, Jason

config :ex_aws,
  access_key_id: [System.get_env("AWS_ACCESS_KEY_ID"), :instance_role],
  secret_access_key: [System.get_env("AWS_SECRET_ACCESS_KEY"), :instance_role]

config :PhoenixReactRenderExample, jwt_secret: "secret"

# see releases.exs for production config
config :PhoenixReactRenderExample, cluster_topologies: []

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
