defmodule ByteSlyceWeb.UrlFormTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  @button Query.css(".submit-button")
  @error Query.css(".error")

  feature "exists", %{session: session} do
    session
    |> visit("/")
    |> take_screenshot()
    |> assert_has(@button)
    |> click(@button)
    |> assert_has(@error)
    # |> List.first()
    # |> assert_has(Query.css(".user-name", text: "Chris"))
  end
end
