defmodule ByteSlyceWeb.UrlFormTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  @button Query.css(".submit-button")
  @error Query.css(".error")
  @input Query.css("input")

  feature "error dialog appears when invalid input is entered", %{session: session} do
    session
    |> visit("/")
    |> take_screenshot()
    |> assert_has(@button)
    |> fill_in(@input, with: "aaaa")
    |> assert_has(@error)
  end

  feature "error message does not appear when first few characters match http(s)://", %{session: session} do
    session
    |> visit("/")
    |> fill_in(@input, with: "htt")
    |> refute_has(@error)
  end

  feature "error message appears when server throws an error", %{session: session} do
    session
    |> visit("/")
    |> assert_has(@button)
    |> fill_in(@input, with: "htt")
    |> click(@button)
    |> assert_has(@error)
  end
end
