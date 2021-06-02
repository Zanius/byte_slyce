defmodule ByteSlyceWeb.SlugController do
  use ByteSlyceWeb, :controller

  alias ByteSlyce.LongUrls
  alias Ecto

  action_fallback ByteSlyceWeb.FallbackController

  def slug_redirect(conn, %{"url_slug" => url_slug}) do
    long_url = LongUrls.get_long_url_by_slug!(url_slug)

    conn
    |> put_status(:moved_permanently)
    |> redirect(external: long_url.url)
  end
end
