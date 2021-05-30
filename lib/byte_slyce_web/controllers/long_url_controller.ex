defmodule ByteSlyceWeb.LongUrlController do
  use ByteSlyceWeb, :controller

  alias ByteSlyce.LongUrls
  alias ByteSlyce.LongUrls.LongUrl

  action_fallback ByteSlyceWeb.FallbackController

  def create(conn, %{"long_url" => long_url_params}) do
    with {:ok, %LongUrl{} = long_url} <- LongUrls.create_long_url(long_url_params) do
      conn
      |> put_status(:created)
      |> render("show.json", long_url: long_url)
    end
  end
end
