defmodule PhoenixReactRenderExampleWeb.PageControllerTest do
  use PhoenixReactRenderExampleWeb.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Hello"
  end

  test "GET /styleguide", %{conn: conn} do
    conn = get(conn, Routes.page_path(conn, :styleguide))
    assert html_response(conn, 200) =~ "Style Guide"
  end
end
