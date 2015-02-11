defmodule ExServer.Model.User do
  use ExServer.Model.Base

  def get_all_users_json do
    query = "SELECT * FROM users"
    exec_query_to_json(query)
  end

  def get_user_json(user_id) do
    query = "SELECT * FROM users where id = #{user_id}"
    exec_query_to_json(query)
  end

end
