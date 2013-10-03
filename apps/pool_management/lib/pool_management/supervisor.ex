defmodule PoolManagement.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    pool_options = [
      name: {:local, :hello_pool},
      worker_module: PoolManagement.HelloWorker,
      size: 5,
      max_overflow: 10
    ]

    children = [
      :poolboy.child_spec(:hello_pool, pool_options, [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
