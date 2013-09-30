defmodule RiakExample.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link({:local, :riak_client_sup}, __MODULE__, [])
  end


  def init([]) do
    children = [
      worker(:riakc_pb_socket, ['127.0.0.1', 8087], id: :riak_client)
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.Behaviour.html
    # for other strategies and supported options
    supervise(children, strategy: :one_for_one)
  end
end
