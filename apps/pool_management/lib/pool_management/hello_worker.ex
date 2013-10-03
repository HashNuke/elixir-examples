defmodule PoolManagement.HelloWorker do
  use GenServer.Behaviour

  def start_link([]) do
    :gen_server.start_link(__MODULE__, [], [])
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(:greet, from, state) do
    {:reply, "Hello from #{self |> pid_to_list}", state}
  end
end
