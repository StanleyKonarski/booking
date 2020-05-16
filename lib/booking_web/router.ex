defmodule BookingWeb.Router do
  use BookingWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", BookingWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/reservation/all", ReservationController, :list

    get "/reservation/new", ReservationController, :create

    post "/reservation/new", ReservationController, :add

    get "/reservation/available", ReservationController, :available

    post "/reservation/available", ReservationController, :addr

    get "/reservation/:id", ReservationController, :show

  end

  # Other scopes may use custom stacks.
  # scope "/api", BookingWeb do
  #   pipe_through :api
  # end
end
