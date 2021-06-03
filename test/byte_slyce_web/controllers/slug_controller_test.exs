defmodule ByteSlyceWeb.SlugControllerTest do
  use ByteSlyceWeb.ConnCase

  alias ByteSlyce.LongUrls

  @create_attrs %{
    url: "https://www.someurl.com"
  }
  @invalid_slug "zz"
  @overflow_slug "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
  @redirect_response "<html><body>You are being <a href=\"https://www.someurl.com\">redirected</a>.</body></html>"

  def long_url_fixture() do
    {:ok, long_url} = LongUrls.create_long_url(@create_attrs)
    long_url
  end

  describe "slug_redirect/2" do
    test "returns a 301 redirect when a long url is found", %{conn: conn} do
      long_url = long_url_fixture()
      slug = LongUrls.encode_url_id(long_url.id)

      conn = get(conn, Routes.slug_path(conn, :slug_redirect, slug))
      assert html_response(conn, 301) == @redirect_response
    end

    test "returns a 404 when decoding a slug that doesn't exist", %{conn: conn} do
      assert_error_sent :not_found, fn ->
        get(conn, Routes.slug_path(conn, :slug_redirect, @invalid_slug))
      end
    end

    test "returns a 404 when decoding a slug causes an integer overflow", %{conn: conn} do
      conn = get(conn, Routes.slug_path(conn, :slug_redirect, @overflow_slug))
      assert html_response(conn, 404)
    end

    test "handles 5 requests in less than a second", %{conn: conn} do
      long_url = long_url_fixture()
      slug = LongUrls.encode_url_id(long_url.id)

      time = :timer.tc(fn ->
        for _n <- 0..4 do
          get(conn, Routes.slug_path(conn, :slug_redirect, slug))
        end
      end) |> elem(0)

      assert time < 1_000_000
    end
  end
end
