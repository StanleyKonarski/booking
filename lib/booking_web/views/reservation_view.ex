defmodule BookingWeb.ReservationView do
  use BookingWeb, :view

  def date_format(dt) do
    DateTime.to_date(dt)
  end
end
