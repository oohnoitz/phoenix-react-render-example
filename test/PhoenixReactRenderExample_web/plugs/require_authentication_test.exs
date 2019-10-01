defmodule PhoenixReactRenderExampleWeb.RequireAuthenticationTest do
  use PhoenixReactRenderExampleWeb.ConnCase, async: true
  alias PhoenixReactRenderExampleWeb.RequireAuthentication

  test "init" do
    assert RequireAuthentication.init([]) == []
  end
end
