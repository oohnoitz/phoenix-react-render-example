defmodule PhoenixReactRenderExampleWeb.FallbackController do
  use PhoenixReactRenderExampleWeb, :controller

  def call(conn, :not_found) do
    conn
    |> put_status(404)
    |> put_view(PhoenixReactRenderExampleWeb.ErrorView)
    |> render("404.html")
  end
end
