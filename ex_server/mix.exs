defmodule ExServer.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_server,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     #erl_opts: erl_opts,
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [ mod: {ExServer, []},
      applications: [:kernel, :stdlib,
                     :emysql,
                     :cowlib, :cowboy,
                     #:compiler, :syntax_tools, :goldrush, :lager,
                     :logger],
      registered: [:emysql_conn_mgr, :emysql_sup],
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:cowboy, github: "extend/cowboy"},
      {:jsonx,  github: "iskra/jsonx"},
      {:emysql, github: "Eonblast/Emysql"},
      {:lager,  github: "basho/lager"},
    ]
  end

  #defp erl_opts do
  #  [{:parse_transform, :lager_transform}]
  #end

end
