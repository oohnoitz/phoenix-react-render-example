defmodule PhoenixReactRenderExample.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    setup()

    topologies = Application.get_env(:PhoenixReactRenderExample, :cluster_topologies)

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(PhoenixReactRenderExample.Repo, []),
      # Start the endpoint when the application starts
      supervisor(PhoenixReactRenderExampleWeb.Endpoint, []),
      # Start your own worker by calling: PhoenixReactRenderExample.Worker.start_link(arg1, arg2, arg3)
      # worker(PhoenixReactRenderExample.Worker, [arg1, arg2, arg3]),
      {Cluster.Supervisor, [topologies, [name: PhoenixReactRenderExample.ClusterSupervisor]]},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixReactRenderExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixReactRenderExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp setup do
    PhoenixReactRenderExampleWeb.Phoenix.Instrumenter.setup()
    PhoenixReactRenderExampleWeb.PipelineInstrumenter.setup()
    PhoenixReactRenderExampleWeb.Repo.Instrumenter.setup()
    Prometheus.Registry.register_collector(:prometheus_process_collector)
    PhoenixReactRenderExampleWeb.MetricsExporter.setup()

    :ok =
      :telemetry.attach(
        "prometheus-ecto",
        [:PhoenixReactRenderExample, :repo, :query],
        &PhoenixReactRenderExampleWeb.Repo.Instrumenter.handle_event/4,
        %{}
      )
  end
end
