defmodule ByteSlyceWeb.PageControllerTest do
  use ByteSlyceWeb.ConnCase

  describe "index/2" do
    test "GET /", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ ""
    end
  end
end
