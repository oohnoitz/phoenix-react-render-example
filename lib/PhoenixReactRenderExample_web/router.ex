defmodule PhoenixReactRenderExampleWeb.Router do
  use PhoenixReactRenderExampleWeb, :router
  use Plug.ErrorHandler
  alias PhoenixReactRenderExampleWeb.{RequireAuthentication, LoadUser, RequireAnonymous, RequireAdmin}

  defp handle_errors(conn, error_data) do
    PhoenixReactRenderExampleWeb.ErrorReporter.handle_errors(conn, error_data)
  end

  if Mix.env() == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LoadUser
  end

  pipeline :require_authoritzation do
    plug RequireAuthentication
  end

  pipeline :require_anonymous do
    plug RequireAnonymous
  end

  pipeline :require_admin do
    plug RequireAdmin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixReactRenderExampleWeb do
    # Use the default browser stack
    pipe_through [:browser]
    get "/", PageController, :index
    get "/styleguide", PageController, :styleguide
    get "/email/verify", EmailVerificationController, :verify
  end

  scope "/", PhoenixReactRenderExampleWeb do
    pipe_through [:browser, :require_anonymous]

    get "/register", AccountController, :new
    post "/register", AccountController, :create

    get "/sessions/new", SessionController, :new
    post "/sessions/new", SessionController, :create

    resources("/forgot_password", ForgotPasswordController, only: [:new, :create, :edit])
    post("/forgot_password/reset", ForgotPasswordController, :reset)
  end

  scope "/", PhoenixReactRenderExampleWeb do
    pipe_through [:browser, :require_authoritzation]

    get "/sessions/delete", SessionController, :delete
    get "/account/settings", AccountController, :edit
    put "/account/settings", AccountController, :update
    put "/account/update_password", AccountController, :update_password
  end

  scope "/admin" do
    pipe_through [:browser, :require_authoritzation, :require_admin]

    forward("/", Adminable.Plug,
      otp_app: :PhoenixReactRenderExample,
      repo: PhoenixReactRenderExample.Repo,
      schemas: [PhoenixReactRenderExample.User],
      layout: {PhoenixReactRenderExampleWeb.LayoutView, "app.html"}
    )
  end

  scope "/images" do
    pipe_through([:browser, :require_authoritzation])

    forward("/sign", Transmit,
      signer: Transmit.S3Signer,
      bucket: "PhoenixReactRenderExample",
      path: "uploads"
    )
  end

  scope "/api", PhoenixReactRenderExampleWeb.API, as: :api do
    pipe_through [:browser, :require_anonymous]

    post("/authenticate", AuthenticationController, :authenticate)
  end

  scope "/api", PhoenixReactRenderExampleWeb.API, as: :api do
    pipe_through [:browser, :require_authoritzation]
  end
end
