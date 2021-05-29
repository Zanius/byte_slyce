defmodule ByteSlyceWeb.LongUrlController do
  use ByteSlyceWeb, :controller

  alias ByteSlyce.LongUrls
  alias ByteSlyce.LongUrls.LongUrl

  action_fallback ByteSlyceWeb.FallbackController

  def index(conn, _params) do
    long_urls = LongUrls.list_long_urls()
    render(conn, "index.json", long_urls: long_urls)
  end

  def create(conn, %{"long_url" => long_url_params}) do
    with {:ok, %LongUrl{} = long_url} <- LongUrls.create_long_url(long_url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.long_url_path(conn, :show, long_url))
      |> render("show.json", long_url: long_url)
    end
  end

  def show(conn, %{"id" => id}) do
    long_url = LongUrls.get_long_url!(id)
    render(conn, "show.json", long_url: long_url)
  end

  def update(conn, %{"id" => id, "long_url" => long_url_params}) do
    long_url = LongUrls.get_long_url!(id)

    with {:ok, %LongUrl{} = long_url} <- LongUrls.update_long_url(long_url, long_url_params) do
      render(conn, "show.json", long_url: long_url)
    end
  end

  def delete(conn, %{"id" => id}) do
    long_url = LongUrls.get_long_url!(id)

    with {:ok, %LongUrl{}} <- LongUrls.delete_long_url(long_url) do
      send_resp(conn, :no_content, "")
    end
  end
end
