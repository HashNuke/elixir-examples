defmodule PoolManagement.Mixfile do
  use Mix.Project

  def project do
    [ app: :pool_management,
      version: "0.0.1",
      elixir: "~> 0.10.2",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      registered: [:hello_server],
      mod: { PoolManagement, [] },
      env: [
        pools: [
          hello: [size: 5, max_overflow: 10]
        ]
      ]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      {:poolboy, github: "devinus/poolboy", tag: "1.0.0"}
    ]
  end
end
