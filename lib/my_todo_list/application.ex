defmodule MyTodoList.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MyTodoList.Repo,
      # Start the Telemetry supervisor
      MyTodoListWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MyTodoList.PubSub},
      # Start the Endpoint (http/https)
      MyTodoListWeb.Endpoint
      # Start a worker by calling: MyTodoList.Worker.start_link(arg)
      # {MyTodoList.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyTodoList.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyTodoListWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
