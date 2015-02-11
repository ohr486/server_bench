defmodule ExServer.Handler.Groups do
  require Logger

  def init(req, opts) do
    Logger.info "--- groups request received ---"

    groups_data = ExServer.Model.Group.get_all_groups_json
    req2 = :cowboy_req.reply(200, [{"content-type", "application/json"}], groups_data, req)

    {:ok, req2, opts}
  end
end
