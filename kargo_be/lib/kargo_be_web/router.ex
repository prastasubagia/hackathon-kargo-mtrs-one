defmodule KargoBeWeb.Router do
  use KargoBeWeb, :router

  # Enables static file hosting
  pipeline :static do
    plug Plug.Static,
      at: "/static",
      from: {:kargo_be, "priv/static"}
  end

  scope "/static", KargoBeWeb do
    pipe_through :static

    get "/*path", FallbackController, :not_found
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: ["http://localhost"]
  end

  scope "/api", KargoBeWeb do
    pipe_through :api

    resources "/trucks", TruckController, except: [:new, :edit]
    resources "/truck-types", TruckTypeController, except: [:new, :edit]
    resources "/drivers", DriverController, except: [:new, :edit]
    resources "/transporters", TransporterController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: KargoBeWeb.Telemetry
    end
  end
end
