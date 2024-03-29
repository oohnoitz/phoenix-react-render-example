defmodule PhoenixReactRenderExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :PhoenixReactRenderExample,
      version: System.get_env("APP_VERSION") || "0.0.1",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        integration_tests: :test
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhoenixReactRenderExample.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "test/integration"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0-rc", override: true},
      {:phoenix_pubsub, "~> 1.0"},
      {:ecto_sql, "~> 3.0-rc"},
      {:phoenix_ecto, "~> 4.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.2.0-rc.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.7"},
      {:credo, "~> 1.0", only: :dev},
      {:excoveralls, "~> 0.7", only: :test},
      {:comeonin, "~> 5.0"},
      {:bcrypt_elixir, "~> 2.0"},
      {:harmonium, "~> 2.0.0"},
      {:jason, "~> 1.0"},
      {:rollbax, "~> 0.9"},
      {:bamboo, "~> 1.3.0"},
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"},
      {:ex_machina, "~> 2.2", only: :test},
      {:stream_data, "~> 0.4.2", only: :test},
      {:joken, "~> 2.0"},
      {:hound, "~> 1.0", only: :test},
      {:cabbage, "~> 0.3.5", only: :test},
      {:scrivener_ecto, "~> 2.0"},
      {:transmit, "~> 0.2"},
      {:adminable, "~> 0.1"},
      {:telemetry, "~> 0.4.0"},
      {:prometheus_phoenix, "~> 1.2"},
      {:prometheus_ecto, "~> 1.4"},
      {:prometheus_plugs, "~> 1.1"},
      {:prometheus_process_collector, "~> 1.4"},
      {:libcluster, "~> 3.0"},
      {:react_render, "~> 3.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      compile: ["compile --warnings-as-errors"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      integration_tests: [
        "webpack",
        "ecto.create --quiet",
        "ecto.migrate",
        "test --only feature"
      ],
      webpack: &run_webpack/1
    ]
  end

  defp run_webpack(_) do
    System.cmd("npm", ["install"], cd: "assets")
    System.cmd("npm", ["run", "build"], cd: "assets")
  end
end
