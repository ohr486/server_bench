defmodule ExServer do
  @behaviour :application

  def start(_type, _args) do
    # for cowboy
    dispatch = :cowboy_router.compile(cowboy_routes)
    {:ok, _} = :cowboy.start_http(:http, 100, [{:port, 4000}], [{:env, [{:dispatch, dispatch}]}])
   
    # for emysql
    :emysql.add_pool(:e_server_pool, emysql_opts)

    # for sup
    ExServer.Supervisor.start_link
  end

  def stop(_state) do
    :ok
  end

  defp cowboy_routes do
    [
      {:_, [
             {"/ping",            ExServer.Handler.Ping,   []},
             {"/users",           ExServer.Handler.Users,  []},
             {"/user/:user_id",   ExServer.Handler.User,   []},
             {"/groups",          ExServer.Handler.Groups, []},
             {"/group/:group_id", ExServer.Handler.Group,  []},
           ]
      }
    ]
  end

  defp emysql_opts do
    [database: "server_bench_dev", user: "root", size: 1]
    |> Enum.map fn({k,v}) -> {k, bin_to_ch(v)} end
  end

  defp bin_to_ch(val) when is_binary(val), do: String.to_char_list(val)
  defp bin_to_ch(val), do: val
end
