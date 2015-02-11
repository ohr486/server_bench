defmodule ExServer.Model.Base do

  defmacro __using__(_opts) do
    quote do
      def exec_query_to_json(query) do
        :emysql.execute(:e_server_pool, query)
          |> :emysql.as_json
          |> :jsonx.encode
      end
    end
  end

end
