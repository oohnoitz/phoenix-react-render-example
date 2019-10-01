defmodule PhoenixReactRenderExample.Sessions do
  @moduledoc """
  Module for handling session changeset actions
  """
  import Ecto.Changeset
  alias PhoenixReactRenderExample.Session

  def new(model \\ %Session{}, params \\ %{}) do
    model
    |> Session.changeset(params)
  end

  def validate(model \\ %Session{}, params \\ %{}) do
    model
    |> new(params)
    |> apply_action(:update)
  end
end
