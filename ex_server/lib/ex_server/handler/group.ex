defmodule ExServer.Handler.Group do
  require Logger

  def init(req, opts) do
    group_id = :cowboy_req.binding(:group_id, req)
    Logger.info "--- group(#{group_id}) request received ---"

    group_data = ExServer.Model.Group.get_group_json(group_id)
    req2 = :cowboy_req.reply(200, [{"content-type", "application/json"}], group_data, req)

    {:ok, req2, opts}
  end
end
