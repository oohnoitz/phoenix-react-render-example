defmodule Mix.Tasks.PhoenixReactRenderExample.GrantAdmin.Test do
  use PhoenixReactRenderExample.DataCase, async: true
  alias Mix.Tasks.PhoenixReactRenderExample.GrantAdmin
  alias PhoenixReactRenderExample.Users
  import ExUnit.CaptureIO

  test "PhoenixReactRenderExample.make_admin" do
    user = insert(:user)

    assert capture_io(fn ->
             GrantAdmin.run([user.email])
           end) =~ "is now an admin"

    assert Users.get_user(user.id).admin
  end
end
