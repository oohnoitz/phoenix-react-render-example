defmodule PhoenixReactRenderExampleWeb.PageView do
  use PhoenixReactRenderExampleWeb, :view

  def react_component(name, props) when is_list(props) do
    react_component(name, Enum.into(props, %{}))
  end

  def react_component(name, props) when is_map(props) do
    component = "#{File.cwd!}/assets/js/components/#{name}"

    ReactRender.render(component, props)
  end
end
