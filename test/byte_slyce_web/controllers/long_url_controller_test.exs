defmodule ByteSlyceWeb.LongUrlControllerTest do
  use ByteSlyceWeb.ConnCase

  @create_attrs %{
    url: "https://www.someurl.com"
  }
  @invalid_attrs %{url: "www.someurl.com"}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create/2" do
    test "renders long_url when data is valid", %{conn: conn} do
      conn = post(conn, Routes.long_url_path(conn, :create), long_url: @create_attrs)
      assert %{"id" => _id, "url" => "https://www.someurl.com"} = json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.long_url_path(conn, :create), long_url: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
