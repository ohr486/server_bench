defmodule ExServer.Handler.Ping do
  require Logger

  def init(req, opts) do
    Logger.info "--- ping received ---"
    req2 = :cowboy_req.reply(200, [{"content-type", "text/plain"}], "pong", req)
    {:ok, req2, opts}
  end
end
