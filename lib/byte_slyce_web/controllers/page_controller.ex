defmodule ByteSlyceWeb.PageController do
  use ByteSlyceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", root_url: System.get_env("ROOT_URL"))
  end
end
