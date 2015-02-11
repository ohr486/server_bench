defmodule ExServer.Model.Group do
  use ExServer.Model.Base

  def get_all_groups_json do
    query = "SELECT * FROM groups"
    exec_query_to_json(query)
  end

  def get_group_json(group_id) do
    query = "SELECT * FROM groups where id = #{group_id}"
    exec_query_to_json(query)
  end

end
