defmodule ExServer.Handler.User do
  require Logger

  def init(req, opts) do
    user_id = :cowboy_req.binding(:user_id, req)
    Logger.info "--- user(#{user_id}) request received ---"

    user_data = ExServer.Model.User.get_user_json(user_id)
    req2 = :cowboy_req.reply(200, [{"content-type", "application/json"}], user_data, req)

    {:ok, req2, opts}
  end
end
