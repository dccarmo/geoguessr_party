defmodule GeoguessrParty.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GeoguessrParty.Repo,
      # Start the Telemetry supervisor
      GeoguessrPartyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GeoguessrParty.PubSub},
      # Start the Endpoint (http/https)
      GeoguessrPartyWeb.Endpoint
      # Start a worker by calling: GeoguessrParty.Worker.start_link(arg)
      # {GeoguessrParty.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GeoguessrParty.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GeoguessrPartyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
