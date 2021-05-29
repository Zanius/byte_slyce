defmodule ByteSlyceWeb.LongUrlView do
  use ByteSlyceWeb, :view
  alias ByteSlyceWeb.LongUrlView

  def render("index.json", %{long_urls: long_urls}) do
    %{data: render_many(long_urls, LongUrlView, "long_url.json")}
  end

  def render("show.json", %{long_url: long_url}) do
    %{data: render_one(long_url, LongUrlView, "long_url.json")}
  end

  def render("long_url.json", %{long_url: long_url}) do
    %{id: long_url.id,
      url: long_url.url}
  end
end
