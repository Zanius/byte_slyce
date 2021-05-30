defmodule ByteSlyceWeb.SlugControllerTest do
  use ByteSlyceWeb.ConnCase

  alias ByteSlyce.LongUrls

  @create_attrs %{
    url: "https://www.someurl.com"
  }
  @invalid_attrs %{url_slug: "notarealslug"}
  @redirect_response "<html><body>You are being <a href=\"https://www.someurl.com\">redirected</a>.</body></html>"

  def long_url_fixture() do
    {:ok, long_url} = LongUrls.create_long_url(@create_attrs)
    long_url
  end

  # setup %{conn: conn} do
  #   {:ok, conn: put_req_header(conn, "accept", ["html"])}
  # end

  describe "redirect with slug" do
    test "returns a 301 redirect when a long url is found", %{conn: conn} do
      long_url = long_url_fixture()
      slug = LongUrls.encode_url_id(long_url.id)
      IO.puts(slug)

      # conn = get(conn, Routes.slug_path(conn, :show, id)

      conn = get(conn, Routes.slug_path(conn, :slug_redirect, slug))

      assert html_response(conn, 301) == @redirect_response
      # IO.puts(conn)
      # assert %{"id" => _id, "url" => "https://www.someurl.com"} = json_response(conn, 301)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn} do
    #   conn = get(conn, Routes.slug_path(conn, :slug_redirect), @invalid_attrs)
    #   assert json_response(conn, 404)["errors"] != %{}
    # end
  end
end
