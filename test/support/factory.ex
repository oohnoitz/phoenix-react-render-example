defmodule PhoenixReactRenderExample.Factory do
  alias PhoenixReactRenderExample.{Repo}
  use ExMachina.Ecto, repo: Repo
  alias PhoenixReactRenderExample.Generators

  def user_factory do
    Generators.generate(:user)
  end
end
