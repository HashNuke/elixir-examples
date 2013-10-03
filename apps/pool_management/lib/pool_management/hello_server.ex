defmodule PoolManagement.HelloServer do

  def start_link do
    :gen_server.start_link({:local, :hello_server}, __MODULE__, [], [])
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(:greet, from, state) do
    {:reply, "hello", state}
  end
end
