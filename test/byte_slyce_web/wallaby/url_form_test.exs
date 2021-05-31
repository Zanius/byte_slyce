defmodule ByteSlyceWeb.UrlFormTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  @button Query.css(".submit-button")
  @error Query.css(".error")
  @input Query.css("input")

  feature "exists", %{session: session} do
    session
    |> visit("/")
    |> assert_has(@button)
    |> fill_in(@input, with: "aaaa")
    |> assert_has(@error)
    |> take_screenshot()
  end
end
