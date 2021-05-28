defmodule ByteSlyceWeb.PageController do
  use ByteSlyceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
