defmodule Mix.Tasks.PhoenixReactRenderExample.RevokeAdmin do
  use Mix.Task

  alias PhoenixReactRenderExample.{ReleaseTasks}

  @shortdoc "Revokes the given user admin access"

  @moduledoc """
  Revokes the given user admin access

  usage:

  mix PhoenixReactRenderExample.revoke_admin <email>
  """

  @doc false
  def run([email]) do
    Mix.Task.run("app.start")
    ReleaseTasks.revoke_admin_access(email)
  end
end
