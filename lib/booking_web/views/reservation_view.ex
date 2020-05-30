defmodule BookingWeb.ReservationView do
  use BookingWeb, :view
  use Timex

  def format_date(date) do
    Timex.format!(date, "{D}-{0M}-{YYYY}")
  end
end
