defmodule RiakExample do
  use Application.Behaviour

  # Start the supervisor
  def start(_type, _args) do
    RiakExample.Supervisor.start_link
  end


  def ping do
    :riakc_pb_socket.ping(riak_client)
  end


  def list do
    :riakc_pb_socket.list_keys(riak_client, "students")
  end


  def create(details) do
    obj = :riakc_obj.new("students", :undefined, details)
    :riakc_pb_socket.put(riak_client, obj)
  end


  def get(key) do
    {:ok, obj} = :riakc_pb_socket.get(riak_client, "students", key)
    :riakc_obj.get_values(obj) |> hd |> binary_to_term
  end


  def update(key, value) do
    {:ok, obj} = :riakc_pb_socket.get(riak_client, "students", key)
    updated_obj = :riakc_obj.update_value(obj, value)
    :riakc_pb_socket.put(riak_client, updated_obj, [:return_body])
  end


  def delete(key) do
    :riakc_pb_socket.delete(riak_client, "students", key)
  end


  defp riak_client do
    # :supervisor.which_children() will return
    # a list of children the supervisor is supervising
    # We are supervising only one process,
    # So we'll pass it to the hd() function and get the first element

    {_, client_pid, _, _} = :supervisor.which_children(:riak_client_sup)
                              |> hd
    client_pid
  end
end