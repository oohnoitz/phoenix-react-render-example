defmodule Mix.Tasks.PhoenixReactRenderExample.RevokeAdmin.Test do
  use PhoenixReactRenderExample.DataCase, async: true
  alias Mix.Tasks.PhoenixReactRenderExample.RevokeAdmin
  alias PhoenixReactRenderExample.Users
  import ExUnit.CaptureIO

  test "PhoenixReactRenderExample.revoke_admin" do
    user = insert(:user)

    assert capture_io(fn ->
             RevokeAdmin.run([user.email])
           end) =~ "admin access revoked"

    refute Users.get_user(user.id).admin
  end
end
