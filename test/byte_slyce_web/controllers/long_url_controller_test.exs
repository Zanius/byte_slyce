defmodule ByteSlyceWeb.LongUrlControllerTest do
  use ByteSlyceWeb.ConnCase

  alias ByteSlyce.LongUrls
  alias ByteSlyce.LongUrls.LongUrl

  @create_attrs %{
    url: "some url"
  }
  @update_attrs %{
    url: "some updated url"
  }
  @invalid_attrs %{url: nil}

  def fixture(:long_url) do
    {:ok, long_url} = LongUrls.create_long_url(@create_attrs)
    long_url
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all long_urls", %{conn: conn} do
      conn = get(conn, Routes.long_url_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create long_url" do
    test "renders long_url when data is valid", %{conn: conn} do
      conn = post(conn, Routes.long_url_path(conn, :create), long_url: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.long_url_path(conn, :show, id))

      assert %{
               "id" => id,
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.long_url_path(conn, :create), long_url: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update long_url" do
    setup [:create_long_url]

    test "renders long_url when data is valid", %{conn: conn, long_url: %LongUrl{id: id} = long_url} do
      conn = put(conn, Routes.long_url_path(conn, :update, long_url), long_url: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.long_url_path(conn, :show, id))

      assert %{
               "id" => id,
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, long_url: long_url} do
      conn = put(conn, Routes.long_url_path(conn, :update, long_url), long_url: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete long_url" do
    setup [:create_long_url]

    test "deletes chosen long_url", %{conn: conn, long_url: long_url} do
      conn = delete(conn, Routes.long_url_path(conn, :delete, long_url))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.long_url_path(conn, :show, long_url))
      end
    end
  end

  defp create_long_url(_) do
    long_url = fixture(:long_url)
    %{long_url: long_url}
  end
end
