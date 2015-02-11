defmodule ExServer.Handler.Users do
  require Logger

  def init(req, opts) do
    Logger.info "--- users request received ---"

    users_data = ExServer.Model.User.get_all_users_json
    req2 = :cowboy_req.reply(200, [{"content-type", "application/json"}], users_data, req)

    {:ok, req2, opts}
  end
end
