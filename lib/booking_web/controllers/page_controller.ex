defmodule BookingWeb.PageController do
  use BookingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, _params) do
    render(conn, "rooms.html")
  end
end
