defmodule RiakExample.Mixfile do
  use Mix.Project

  def project do
    [ app: :riak_example,
      version: "0.0.1",
      elixir: "~> 0.10.2",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { RiakExample, [] }]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      {:riakc,  github: "basho/riak-erlang-client"},
      {:jsx,    github: "talentdeficit/jsx", tag: "v1.4.3"}
    ]
  end
end
