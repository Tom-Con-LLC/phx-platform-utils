defmodule PhxPlatformUtils.Plugs.GetUser do
  import Plug.Conn
  require Jason

  def init(opts), do: opts

  def call(conn, _opts) do
    token = get_token!(conn)
    cond do
      is_nil(token) ->
        conn |> halt |> send_resp(401, "Unauthorized")

      true ->
        user = token |> decode_token!()
        assign(conn, :user, user)
    end
  end

  defp get_token!(conn) do
    case get_req_header(conn, "authorization") do
      ["Bearer " <> token] -> token
      _ -> nil
    end
  end

  defp decode_token!(token) do
    [_, payload, _] = token |> String.split(".")
    payload |> Base.decode64!(padding: false) |> Jason.decode!(keys: :atoms)
  end
end
