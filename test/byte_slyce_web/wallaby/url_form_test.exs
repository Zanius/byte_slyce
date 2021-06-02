defmodule ByteSlyceWeb.UrlFormTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  @button Query.css(".submit-button")
  @error Query.css(".error")
  @success Query.css(".success")
  @input Query.css("input")
  @valid_url "https://www.validurl.com"

  feature "error dialog appears when invalid input is entered", %{session: session} do
    session
    |> visit("/")
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

  feature "success message appears when button is clicked with a valid url", %{session: session} do
    session
    |> visit("/")
    |> assert_has(@button)
    |> fill_in(@input, with: @valid_url)
    |> click(@button)
    |> assert_has(@success)
  end

  feature "input field is cleared when a url is submitted", %{session: session} do
    session
    |> visit("/")
    |> assert_has(@button)
    |> fill_in(@input, with: @valid_url)
    |> click(@button)
    |> assert_has(Query.css("input", text: ""))
  end
end
