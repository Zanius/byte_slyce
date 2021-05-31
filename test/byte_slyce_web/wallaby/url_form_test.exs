defmodule ByteSlyceWeb.UrlFormTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "exists", %{session: session} do
    session
    |> visit("/")
    |> take_screenshot()

    |> assert_has(Query.css(".submit-button"))
    # |> find(Query.css(".submit-button", count: 1))
    # |> List.first()
    # |> assert_has(Query.css(".user-name", text: "Chris"))
  end
end
