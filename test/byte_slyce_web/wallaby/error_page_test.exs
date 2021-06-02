defmodule ByteSlyceWeb.ErrorPageTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  @button Query.css(".submit-button")
  @root_link Query.css(".root-link")
  @invalid_slug "/zzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

  feature "it has a working link that goes back to the home page in case of invalid slug", %{session: session} do
    session
    |> visit(@invalid_slug)
    |> assert_has(@root_link)
    |> click(@root_link)
    |> assert_has(@button)
  end
end
